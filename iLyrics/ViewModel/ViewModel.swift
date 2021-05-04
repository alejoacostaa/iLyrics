//
//  ViewModel.swift
//  iLyrics
//
//  Created by Alejo Acosta on 27/04/2021.
//

import Foundation


class ViewModel : ObservableObject {
    @Published var searchedSongs = [SongDetails]()
    @Published var apiResponse : APIResponse?
    @Published var lyricsHistory : SongDetails?
    @Published var errorDuringApiCall = false
    @Published var apiError: APIError? {
        didSet {
            errorDuringApiCall = true
        }
    }
    
    
    
    
    
    //Main method that handles the whole API calling/handling
    func loadApiSongData2(songName : String, artistName : String) {
        let rawUrl = "https://api.lyrics.ovh/v1/\(artistName)/\(songName)"
        let fixedUrl = rawUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
 
        
        guard let url = URL(string: fixedUrl!) else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    self.responseHandler(data, response, error, songName, artistName)
                }
            }.resume()
    }
    
    //Completion handler for the API call
    private func responseHandler(_ data: Data?,
                         _ response: URLResponse?,
                         _ error: Error?,
                         _ songName: String,
                         _ artistName: String) {
        if let error = error {
            if error._code == -1009 {
                apiError = .offline
            } else {
                apiError = .sessionError
            }
            return
        }
        guard let response = response as? HTTPURLResponse, let data = data else {
            apiError = .missingDataError
            return
        }
        guard (200..<300).contains(response.statusCode) else {
            switch Status(rawValue: response.statusCode) {
            case .requestTimeout:
                apiError = .timeoutError
            case .internalServerError:
                apiError = .internalServerError
            case .notFound:
                apiError = .notFound
            default:
                apiError = .requestError
            }
            
            return
        }
        do {
            let decodedResponse = try JSONDecoder().decode(Song.self, from: data)
            if(!songAlreadySearched(songName: songName)) {
                let song = SongDetails(songName: songName, artistName: artistName, lyrics: decodedResponse.lyrics)
                searchedSongs.append(song)
            }
            apiResponse = APIResponse(apiValues: [decodedResponse.lyrics])
            
        } catch {
            apiError = .parsingError
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


    //If the user searhes lyrics that have already been searched before, we need to remove that search and add it to the last position of the array. If we do not do this, the order of the cells on Previous Search and History gets messed up.
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
