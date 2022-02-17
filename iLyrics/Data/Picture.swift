//
//  Picture.swift
//  iLyrics
//
//  Created by Alejo Acosta on 13/02/2022.
//

import Foundation

struct PicturesResponse: Decodable {
    let results: [PictureResponse]
}


struct PictureResponse : Codable {
    let picture: Picture?
}

struct Picture: Codable {
    let medium: String?
    let large: String?
    let thumbnail: String?
}
