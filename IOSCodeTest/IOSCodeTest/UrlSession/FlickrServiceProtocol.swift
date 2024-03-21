//
//  FlickrServiceProtocol.swift
//  IOSCodeTest
//
//  Created by Veritha on 21/03/24.
//

import Foundation

protocol FlickrServiceProtocol {
    func fetchImages(for tags: String, completion: @escaping (Result<FlickrResponse, Error>) -> Void)
}
