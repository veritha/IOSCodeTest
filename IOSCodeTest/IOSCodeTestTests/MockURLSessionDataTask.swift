//
//  MockURLSessionDataTask.swift
//  IOSCodeTestTests
//
//  Created by Veritha on 20/03/24.
//

import Foundation
@testable import IOSCodeTest

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    var completionHandler: (() -> Void)?
    
    func resume() {
        completionHandler?()
    }
}
