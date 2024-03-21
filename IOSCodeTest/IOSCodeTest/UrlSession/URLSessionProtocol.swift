//
//  URLSessionProtocol.swift
//  IOSCodeTest
//
//  Created by Veritha on 20/03/24.
//

import Foundation

protocol URLSessionProtocol {
    func urlDataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol
}

extension URLSession: URLSessionProtocol {
    func urlDataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        return dataTask(with: url, completionHandler: completionHandler) as URLSessionDataTaskProtocol
    }
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {}
