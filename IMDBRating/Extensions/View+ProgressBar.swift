//
//  View+ProgressBar.swift
//  IMDBRating
//
//  Created by Nikolay - on 20.10.2025.
//

import SwiftUI

extension View {
    func progressBar(isLoading: Bool) -> some View {
        self
            .modifier(LoadingModifier(withLoading: isLoading))
    }
}
