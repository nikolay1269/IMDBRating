//
//  MoviesViewModel.swift
//  IMDBRating
//
//  Created by Nikolay - on 13.10.2025.
//

import SwiftUI
internal import Combine

class TitlesViewModel: ObservableObject {
    
    @Published var loadedTitles: [ImdbapiTitle] = []
    @Published var canLoad = true
    
    private var page = 1
    private var totalPages = 1000
    private var nextPageToken: String?
    
    init () {
        let memoryCapacity = 200 * 1024 * 1024 // 20 MB
        let diskCapacity = 500 * 1024 * 1024 // 100 MB
        let cache = URLCache(memoryCapacity: memoryCapacity, diskCapacity: diskCapacity, diskPath: "myCache")
        URLCache.shared = cache
    }
    
    func loadNext() {
        guard page <= totalPages else { return }
        guard canLoad else { return }

        canLoad = false
        Task { @MainActor in
            
            guard let result = try? await TitleAPI.iMDbAPIServiceListTitles(pageToken: nextPageToken) else {
                canLoad = true
                return
            }

            loadedTitles.append(contentsOf: result.titles ?? [])
            self.nextPageToken = result.nextPageToken
            
            page += 1
            canLoad = true
        }
    }
}
