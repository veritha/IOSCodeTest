//
//  FlickrService.swift
//  IOSCodeTest
//
//  Created by Veritha on 21/03/24.
//

import Foundation

class FlickrService: FlickrServiceProtocol {
    func fetchImages(for tags: String, completion: @escaping (Result<FlickrResponse, Error>) -> Void) {
        guard let url = URL(string: "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags=\(tags.replacingOccurrences(of: " ", with: ","))") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            do {
                let flickrResponse = try JSONDecoder().decode(FlickrResponse.self, from: data)
                completion(.success(flickrResponse))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

