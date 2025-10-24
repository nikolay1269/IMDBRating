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
}
