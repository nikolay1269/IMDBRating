//
//  MovieBaseInfoView.swift
//  IMDBRating
//
//  Created by Nikolay - on 24.10.2025.
//

import SwiftUI

struct MovieBaseInfoView: View {
    
    var title: ImdbapiTitle?
    
    var body: some View {
        HStack {
            if let year = title?.startYear { Text("\(year, format: .number.grouping(.never))") } else { Text("Year: N/A") }
            if let lengthInSecond = title?.runtimeSeconds {
                let interval = TimeInterval(lengthInSecond)
                Text(interval.formatDuration() ?? "N/A")
            } else {
                Text("N/A")
            }
            if let formattedVoteCount = title?.rating?.voteCount?.formatted(.number.notation(.compactName).precision(.fractionLength(1))) {
                Text("\(title?.rating?.aggregateRating ?? 0, specifier: "%.1f") (\(formattedVoteCount))")
            }
        }
    }
}
