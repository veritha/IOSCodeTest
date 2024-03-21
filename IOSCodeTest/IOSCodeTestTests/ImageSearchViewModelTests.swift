//
//  ImageSearchViewModelTests.swift
//  IOSCodeTestTests
//
//  Created by Veritha on 20/03/24.
//

import XCTest
@testable import IOSCodeTest

final class ImageSearchViewModelTests: XCTestCase {
    
    var viewModel: ImageSearchViewModel!
    var mockService: MockFlickrService!
    
    override func setUp() {
        super.setUp()
        mockService = MockFlickrService()
        viewModel = ImageSearchViewModel(flickrService: mockService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockService = nil
        super.tearDown()
    }
    
    func testFetchImagesSuccess() {
        // Prepare test data
        let flickrItem1 = FlickrItem(media: Media(m: "https://example.com/image1.jpg"), tags: "tag1", title: "Title 1", description: "Description 1", author: "Author 1", published: "2022-01-01")
        let flickrItem2 = FlickrItem(media: Media(m: "https://example.com/image2.jpg"), tags: "tag2", title: "Title 2", description: "Description 2", author: "Author 2", published: "2022-01-02")
        let flickrResponse = FlickrResponse(items: [flickrItem1, flickrItem2])
        mockService.mockFlickrResponse = .success(flickrResponse)
        
        // Set search text
        viewModel.searchText = "example"
        
        // Call fetchImages
        viewModel.fetchImages()
        
        // Assert isLoading state during API call
        XCTAssertTrue(viewModel.isLoading)
        guard let mockResponce = mockService.mockFlickrResponse else {return}
        // Simulate API response
        mockService.mockCompletion?(mockResponce)
        
        // Assert isLoading state after API call
        XCTAssertFalse(viewModel.isLoading)
        
        // Assert flickrItems are not nil
        XCTAssertNil(viewModel.flickrItems)
    }
    
    func testFetchImagesFailure() {
        // Prepare test error
        let testError = NSError(domain: "TestErrorDomain", code: 123, userInfo: nil)
        mockService.mockFlickrResponse = .failure(testError)
        
        // Set search text
        viewModel.searchText = "example"
        
        // Call fetchImages
        viewModel.fetchImages()
        
        // Assert isLoading state during API call
        XCTAssertTrue(viewModel.isLoading)
        guard let responce = mockService.mockFlickrResponse else { return }
        // Simulate API response
        mockService.mockCompletion?(responce)
        
        // Assert isLoading state after API call
        XCTAssertFalse(viewModel.isLoading)
        
        // Assert flickrItems are empty
        XCTAssertTrue(viewModel.flickrItems.isEmpty)
    }
}
