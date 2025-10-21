//
//  ContentView.swift
//  IMDBRating
//
//  Created by Nikolay - on 13.10.2025.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = TitlesViewModel()
    
    var body: some View {
        
        List {
            ForEach(viewModel.loadedTitles, id: \.id) { title in
                
                let isElemLast = viewModel.loadedTitles.needToLoad(title)
                let isLoading = isElemLast && viewModel.canLoad == false
                
                HStack(alignment: .center) {
                    if let urlString = title.primaryImage?.url, let url = URL(string: urlString) {
                        CachedAsyncImage(url: url).frame(width: 100, height: 100)
                    }
                    Spacer()
                    VStack {
                        Text(title.originalTitle ?? "No title available").frame(maxWidth: .infinity)
                        if let year = title.startYear { Text("Year: \(year, format: .number.grouping(.never))") } else { Text("Year: N/A") }
                        if let lengthInSecond = title.runtimeSeconds {
                            Text("\(Duration.seconds(lengthInSecond).formatted(.time(pattern: .hourMinuteSecond)))")
                        } else {
                            Text("Year: N/A")
                        }
                    }
                    .progressBar(isLoading: isLoading)
                    .onAppear {
                        if isElemLast {
                            viewModel.loadNext()
                        }
                    }
                }
            }
        }.onAppear() {
            viewModel.loadNext()
        }
    }
}
