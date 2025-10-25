//
//  TitleDetailViewModel.swift
//  IMDBRating
//
//  Created by Nikolay - on 24.10.2025.
//

import SwiftUI
import Combine

class TitleDetailViewModel: ObservableObject {
    
    @Published var loadedTitle: ImdbapiTitle?
    
    func loadTitleDetail(id: String) async {
        
        loadedTitle = try? await TitleAPI.iMDbAPIServiceGetTitle(titleId: id)
    }
    
    func directorsText() -> String {
        let directorNames: [String]? = loadedTitle?.directors?.map { $0.displayName ?? "" }
        return "Directors: " + (directorNames?.joined(separator: ", ") ?? "N/A")
    }
    
    func writersText() -> String {
        let writerNames: [String]? = loadedTitle?.writers?.map { $0.displayName ?? "" }
        return "Writers: " + (writerNames?.joined(separator: ", ") ?? "N/A")
    }
    
    func starsText() -> String {
        let starNames: [String]? = loadedTitle?.stars?.map { $0.displayName ?? "" }
        return "Stars: " + (starNames?.joined(separator: ", ") ?? "N/A")
    }
}
