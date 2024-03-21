//
//  AsyncImageView.swift
//  IOSCodeTest
//
//  Created by Veritha on 20/03/24.
//

import SwiftUI

struct DetailView: View {
    
    let flickrItem: FlickrItem
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: flickrItem.media.m)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                default:
                    ProgressView()
                }
            }
            .frame(maxWidth: .infinity)
            
            Text(flickrItem.title)
                .font(.headline)
                .padding()
                .accessibilityLabel(Text("Image title: \(flickrItem.title)"))

            Text(flickrItem.description)
                .padding()
                .accessibilityLabel(Text("Image description: \(flickrItem.description)"))
            
            Text("Author: \(flickrItem.author)")
                .padding()
                .accessibilityLabel(Text("Image author: \(flickrItem.author)"))
            
            Text("Published Date: \(formattedDate(from: flickrItem.published))")
                .padding()
                .accessibilityLabel(Text("Published date: \(flickrItem.published)"))
        }
    }
    
    func formattedDate(from dateString: String) -> String {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withFullDate, .withTime, .withDashSeparatorInDate, .withColonSeparatorInTime]
        if let date = dateFormatter.date(from: dateString) {
            let formattedString = DateFormatter.localizedString(from: date, dateStyle: .medium, timeStyle: .medium)
            return formattedString
        } else {
            return "Unknown"
        }
    }
}
