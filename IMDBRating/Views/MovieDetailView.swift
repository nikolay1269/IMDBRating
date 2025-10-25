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
        VStack(alignment: .leading) {
            if (viewModel.loadedTitle?.directors?.count ?? 0) > 0 {
                Text(viewModel.directorsText()).frame(alignment: .leading)
            }
            if (viewModel.loadedTitle?.writers?.count ?? 0) > 0 {
                Text(viewModel.writersText()).frame(alignment: .leading)
            }
            if (viewModel.loadedTitle?.stars?.count ?? 0) > 0 {
                Text(viewModel.starsText()).frame(alignment: .leading)
            }
        }
    }
}
