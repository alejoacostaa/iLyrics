//
//  Song.swift
//  iLyrics
//
//  Created by Alejo Acosta on 27/04/2021.
//

import Foundation




struct APIResponse : Identifiable {
    var id = UUID()
    var apiValues : [String] = []
}

struct SongDetails: Identifiable, Equatable {
    var id = UUID()
    let songName : String
    let artistName : String
    let lyrics : String
    
}


struct Song : Codable {
    var lyrics : String
}











