//
//  HomeView.swift
//  IOSCodeTest
//
//  Created by Veritha on 20/03/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = ImageSearchViewModel()
    
    let gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.searchText, onSearch: viewModel.fetchImages)
                    .padding()
                    .accessibilityLabel(Text("Search for images"))
                
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                        .accessibilityHidden(true)
                } else {
                    ScrollView {
                        LazyVGrid(columns: gridItemLayout, spacing: 10) {
                            ForEach(viewModel.flickrItems.indices, id: \.self) { index in
                                let item = viewModel.flickrItems[index]
                                if let url = URL(string: item.media.m) {
                                    Button(action: {
                                        viewModel.selectedFlickrItem = item
                                        viewModel.showImageDetail.toggle()
                                    }) {
                                        AsyncImage(url: url) { phase in
                                            switch phase {
                                            case .success(let image):
                                                image
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 100, height: 100) // Fixed size for each thumbnail
                                                    .clipped()
                                                    .padding(4)
                                            default:
                                                ProgressView()
                                            }
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                        .accessibilityLabel(Text(item.title))
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Flickr Images")
            .sheet(isPresented: $viewModel.showImageDetail) {
                if let selectedFlickrItem = viewModel.selectedFlickrItem {
                    DetailView(flickrItem: selectedFlickrItem)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
