//
//  MockURLSession.swift
//  IOSCodeTestTests
//
//  Created by Veritha on 20/03/24.
//

import Foundation
@testable import IOSCodeTest

class MockURLSession: URLSessionProtocol {
    var data: Data?
    var response: URLResponse?
    var error: Error?
    
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        let task = MockURLSessionDataTask()
        task.completionHandler = {
            completionHandler(self.data, self.response, self.error)
        }
        return task
    }
}
