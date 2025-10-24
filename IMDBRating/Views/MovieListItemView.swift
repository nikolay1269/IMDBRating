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
                Text(title.originalTitle ?? "No title available").frame(maxWidth: .infinity)
                HStack {
                    if let year = title.startYear { Text("\(year, format: .number.grouping(.never))") } else { Text("Year: N/A") }
                    if let lengthInSecond = title.runtimeSeconds {
                        let interval = TimeInterval(lengthInSecond)
                        Text(interval.formatDuration() ?? "")
                    } else {
                        Text("N/A")
                    }
                    if let formattedVoteCount = title.rating?.voteCount?.formatted(.number.notation(.compactName).precision(.fractionLength(1))) {
                        Text("\(title.rating?.aggregateRating ?? 0, specifier: "%.1f") (\(formattedVoteCount))")
                    }
                }
            }
            .progressBar(isLoading: isLoading)
        }
    }
}
