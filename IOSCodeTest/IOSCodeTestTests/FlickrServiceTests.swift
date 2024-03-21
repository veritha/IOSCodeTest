//
//  FlickrServiceTests.swift
//  IOSCodeTestTests
//
//  Created by Veritha on 21/03/24.
//

import XCTest
@testable import IOSCodeTest
final class FlickrServiceTests: XCTestCase {

        
        var service: FlickrService!
        
        override func setUp() {
            super.setUp()
            service = FlickrService()
        }
        
        override func tearDown() {
            service = nil
            super.tearDown()
        }
        
        func testFetchImages() {
            let expectation = XCTestExpectation(description: "Fetch Images")
            
            service.fetchImages(for: "test") { result in
                switch result {
                case .success(let flickrItems):
                    XCTAssertFalse(flickrItems.isEmpty)
                    expectation.fulfill()
                case .failure(let error):
                    XCTFail("Failed to fetch images with error: \(error.localizedDescription)")
                }
            }
            
            wait(for: [expectation], timeout: 5.0)
        }
    }
