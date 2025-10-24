//
//  ContentView.swift
//  IMDBRating
//
//  Created by Nikolay - on 13.10.2025.
//

import SwiftUI

struct MovieListView: View {
    
    @StateObject private var viewModel = TitlesViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.loadedTitles, id: \.id) { title in
                    
                    let isElemLast = viewModel.loadedTitles.needToLoad(title)
                    let isLoading = isElemLast && viewModel.canLoad == false
                    NavigationLink(destination: MovieDetailView(selectedTitle: title)) {
                        MovieListItemViewq(title: title, isLoading: isLoading)
                            .onAppear {
                                if isElemLast {
                                    viewModel.loadNext()
                                }
                            }
                    }
                }
            }
        }.onAppear() {
            viewModel.loadNext()
        }
    }
}
