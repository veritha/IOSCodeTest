//
//  FlickrItem.swift
//  IOSCodeTest
//
//  Created by Veritha on 20/03/24.
//

import Foundation

struct FlickrItem: Codable, Identifiable {
    let id = UUID()
    let media: Media
    let tags: String
    let title: String
    let description: String
    let author: String
    let published: String

    enum CodingKeys: String, CodingKey {
        case media
        case tags
        case title
        case description = "description"
        case author
        case published
    }
}


struct Media: Codable {
    let m: String
}
