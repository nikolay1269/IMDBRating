//
//  MovieDetailView.swift
//  IMDBRating
//
//  Created by Nikolay - on 24.10.2025.
//

import SwiftUI

struct MovieDetailView: View {
    
    var selectedTitle: ImdbapiTitle
    @StateObject private var viewModel = TitleDetailViewModel()
    
    var body: some View {
        
        if let urlString = viewModel.loadedTitle?.primaryImage?.url, let url = URL(string: urlString) {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .clipped()
            } placeholder: {
                ProgressView()
            }
        }
        Text(viewModel.loadedTitle?.primaryTitle ?? "No title").font(.title3).onAppear() {
            Task {
                await viewModel.loadTitleDetail(id: selectedTitle.id ?? "")
            }
        }
        Text("Original title: \(viewModel.loadedTitle?.originalTitle, default: "N/A")")
        MovieBaseInfoView(title: viewModel.loadedTitle)
        HStack {
            ForEach(viewModel.loadedTitle?.genres ?? [], id: \.self) { genre in
                Text(genre).foregroundColor(.secondary)
            }
        }
        if (viewModel.loadedTitle?.directors?.count ?? 0) > 0 {
            HStack {
                Text("Directors: ")
                ForEach(viewModel.loadedTitle?.directors ?? [], id: \.self) { director in
                    Text(director.displayName ?? "").foregroundColor(.blue)
                }
            }
        }
        if (viewModel.loadedTitle?.writers?.count ?? 0) > 0 {
            HStack {
                Text("Writers: ")
                ForEach(viewModel.loadedTitle?.writers ?? [], id: \.self) { writer in
                    Text(writer.displayName ?? "").foregroundColor(.blue)
                }
            }
        }
        if (viewModel.loadedTitle?.stars?.count ?? 0) > 0 {
            HStack {
                Text("Starts: ")
                ForEach(viewModel.loadedTitle?.stars ?? [], id: \.self) { star in
                    Text(star.displayName ?? "").foregroundColor(.blue)
                }
            }
        }
    }
}
