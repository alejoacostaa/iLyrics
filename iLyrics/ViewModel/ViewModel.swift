//
//  ViewModel.swift
//  iLyrics
//
//  Created by Alejo Acosta on 27/04/2021.
//

import Foundation

class ViewModel : ObservableObject {
    @Published var searchedSongs = [SongDetails]()
    @Published var apiResponse : SongDetails?
    @Published var lyricsHistory : SongDetails?
    @Published var errorDuringApiCall = false
    
    //Main method that handles the whole API calling/handling
    func networkRequest(songName: String, artistName: String) async throws {
        guard let url = URL(string: "https://api.lyrics.ovh/v1/\(artistName)/\(songName)") else  { return }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { return }
        let decoder = JSONDecoder()
        let decodedSong = try decoder.decode(Song.self, from: data)
        let song = SongDetails(songName: songName, artistName: artistName, lyrics: decodedSong.lyrics)
        await MainActor.run {
            if(!songAlreadySearched(songName: songName)) {
                searchedSongs.append(song)
            }
            apiResponse = song
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
