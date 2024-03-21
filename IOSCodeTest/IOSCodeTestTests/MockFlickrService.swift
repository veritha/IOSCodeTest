//
//  MockFlickrService.swift
//  IOSCodeTestTests
//
//  Created by Veritha on 21/03/24.
//

import XCTest
@testable import IOSCodeTest

class MockFlickrService: FlickrServiceProtocol {
    var mockFlickrResponse: Result<FlickrResponse, Error>?
    var mockCompletion: ((Result<FlickrResponse, Error>) -> Void)?
    
    func fetchImages(for searchText: String, completion: @escaping (Result<FlickrResponse, Error>) -> Void) {
        if let response = mockFlickrResponse {
            completion(response)
        } else {
            // Handle the case when mockFlickrResponse is nil
            // For example, you could return a failure result
            completion(.failure(MockError.mockResponseNotFound))
        }
    }
    
    enum MockError: Error {
        case mockResponseNotFound
    }
}
