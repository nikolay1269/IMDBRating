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
}
