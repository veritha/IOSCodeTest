//
//  ImageSearchViewModel.swift
//  IOSCodeTest
//
//  Created by Veritha on 20/03/24.
//

import Foundation

class ImageSearchViewModel: ObservableObject {
    private let flickrService: FlickrServiceProtocol
    
    @Published var searchText = ""
    @Published var flickrItems: [FlickrItem] = []
    @Published var isLoading = false
    @Published var showImageDetail = false
    @Published var selectedFlickrItem: FlickrItem?
    
    init(flickrService: FlickrServiceProtocol = FlickrService()) {
        self.flickrService = flickrService
    }
    
    func fetchImages() {
        isLoading = true
        guard !searchText.isEmpty else {
            flickrItems = []
            isLoading = false
            return
        }
        
        flickrService.fetchImages(for: searchText) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let flickrResponse):
                    self?.flickrItems = flickrResponse.items
                case .failure(let error):
                    print("Error fetching images: \(error)")
                }
            }
        }
    }
}
