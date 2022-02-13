//
//  Picture.swift
//  iLyrics
//
//  Created by Alejo Acosta on 13/02/2022.
//

import Foundation

struct PicturesResponse: Decodable {
    let results: [Picture]
}


struct Picture : Codable {
    let picture: [String: String]
}
