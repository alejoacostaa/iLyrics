//
//  Song.swift
//  iLyrics
//
//  Created by Alejo Acosta on 27/04/2021.
//

import Foundation

struct SongDetails: Identifiable, Equatable {
    var id = UUID()
    let songName : String
    let artistName : String
    let lyrics : String
    
}

struct Song : Codable, Identifiable {
    let id = UUID()
    let lyrics : String
}











