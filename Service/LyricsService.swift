//
//  LyricsService.swift
//  iLyrics
//
//  Created by Alejo Acosta on 13/02/2022.
//

import Foundation

struct LyricsService {
    
    enum LyricsServiceError: Error {
        case failedToCreateURL
        case failedToDecode
        case invalidStatusCode
    }
    
    func fetchLyrics(songName: String, artistName: String) async throws -> Song {
        guard let url = URL(string: "https://api.lyrics.ovh/v1/\(artistName)/\(songName)") else  {
            throw LyricsServiceError.failedToCreateURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw LyricsServiceError.invalidStatusCode
        }
        let decodedSong = try JSONDecoder().decode(Song.self, from: data)
        return decodedSong
    }
    
    func fetchImage() async throws -> [Picture] {
        guard let url = URL(string: "https://randomuser.me/api/?results=10") else {
            throw LyricsServiceError.failedToCreateURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw LyricsServiceError.invalidStatusCode
        }
        let decodedImages = try JSONDecoder().decode(PicturesResponse.self, from: data)
        print(decodedImages.results)
        return decodedImages.results
    }
}
