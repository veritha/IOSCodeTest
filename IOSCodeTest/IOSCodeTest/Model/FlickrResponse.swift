//
//  FlickrResponse.swift
//  IOSCodeTest
//
//  Created by Veritha on 20/03/24.
//

import Foundation

struct FlickrResponse: Codable {
    let items: [FlickrItem]
    
    var isEmpty: Bool {
           return items.isEmpty
    }
}
