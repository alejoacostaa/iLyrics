//
//  ViewModel.swift
//  iLyrics
//
//  Created by Alejo Acosta on 27/04/2021.
//

import Foundation

//Ensures every UI update is performed on the main thread.
@MainActor
class ViewModel : ObservableObject {
    let lyricsService : LyricsService
    @Published var searchedSongs = [SongDetails]()
    @Published var apiResponse : SongDetails?
    @Published var lyricsHistory : SongDetails?
    @Published var showingGenericErrorAlert = false
    @Published var profilePictureURL: String?
    var errorMessage: String?
    
    init(service: LyricsService) {
        lyricsService = service
    }
    
    //Main method that handles the whole API calling/handling
    func lyricsNetworkRequest(songName: String, artistName: String) async {
        do {
            let song = try await lyricsService.fetchLyrics(songName: songName, artistName: artistName)
                let songDetails = SongDetails(songName: songName, artistName: artistName, lyrics: song.lyrics)
                apiResponse = songDetails
                guard let apiResponse = apiResponse else { return }
                if(!songAlreadySearched(songName: songName)) {
                    searchedSongs.append(apiResponse)
                }
        } catch LyricsService.LyricsServiceError.invalidStatusCode {
            showingGenericErrorAlert.toggle()
            errorMessage = "Unable to find lyrics - maybe a typo? Try again!"
        } catch LyricsService.LyricsServiceError.failedToCreateURL {
            showingGenericErrorAlert.toggle()
            errorMessage = "Failed to create URL"
        } catch {
            showingGenericErrorAlert.toggle()
            errorMessage = "Unknown Error"
        }
    }
    
    func pictureNetworkRequest() async {
        do {
            let profilePictures = try await lyricsService.fetchImage()
            let randomPicture = profilePictures.randomElement()
            profilePictureURL = randomPicture?.picture?.thumbnail
        } catch {
            //TODO: Handle errors
        }
    }
    
    //Simply returns lyrics that have already been searched
    func getSong(songName : String) {
        for song in searchedSongs {
            if song.songName == songName {
                print("returning song from history")
                self.lyricsHistory = song
            }
        }
    }

    //If the user searches lyrics that have already been searched before, we need to remove that search and add it to the last position of the array. If we do not do this, the order of the cells on Previous Search and History gets messed up.
    func songAlreadySearched(songName : String) -> Bool {
        for song in self.searchedSongs {
            if song.songName == songName {
                print("Song already in history")
                if let index = self.searchedSongs.firstIndex(of: song) {
                    let element = self.searchedSongs.remove(at: index)
                    self.searchedSongs.append(element)
                }
                return true
            }
        }
        return false
    }
    
    func checkForInternetAccess() -> Bool{
        return NetworkMonitor.shared.isConnected
    }
}
