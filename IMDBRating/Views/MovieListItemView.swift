//
//  MovieListItemView.swift
//  IMDBRating
//
//  Created by Nikolay - on 24.10.2025.
//

import SwiftUI

struct MovieListItemViewq: View {
    
    let title: ImdbapiTitle
    let isLoading: Bool
    
    var body: some View {
        HStack(alignment: .center) {
            if let urlString = title.primaryImage?.url, let url = URL(string: urlString) {
                CachedAsyncImage(url: url).frame(width: 100, height: 100)
            }
            Spacer()
            VStack {
                Text(title.primaryTitle ?? "No title available").frame(maxWidth: .infinity)
                MovieBaseInfoView(title: title)
            }
            .progressBar(isLoading: isLoading)
        }
    }
}
