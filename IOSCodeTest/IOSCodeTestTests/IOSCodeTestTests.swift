//
//  IOSCodeTestTests.swift
//  IOSCodeTestTests
//
//  Created by Veritha on 20/03/24.
//

import XCTest
@testable import IOSCodeTest

final class IOSCodeTestTests: XCTestCase {

    func testFormattedDate() throws {
           let imageView = DetailView(flickrItem: FlickrItem(media: Media(m: ""), tags: "", title: "", description: "", author: "", published: "2024-03-20T12:00:00Z"))
           XCTAssertEqual(imageView.formattedDate(from: "2024-03-20T12:00:00Z"), "Mar 20, 2024 at 12:00:00 PM")
       }

}
