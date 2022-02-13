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
    
//
//    enum CodingKeys: String, CodingKey {
//
//        case large = "large"
//        case medium = "medium"
//        case thumbnail = "thumbnail"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        large = try values.decodeIfPresent(String.self, forKey: .large)
//        medium = try values.decodeIfPresent(String.self, forKey: .medium)
//        thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
//    }
}
