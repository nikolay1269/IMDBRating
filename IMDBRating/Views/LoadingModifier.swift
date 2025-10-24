//
//  LoadingModifier.swift
//  IMDBRating
//
//  Created by Nikolay - on 20.10.2025.
//


import Foundation
import SwiftUI

struct LoadingModifier: ViewModifier {
    let withLoading: Bool

    func body(content: Content) -> some View {
        if withLoading {
            VStack {
                content
                Divider()
                Spacer()
                ProgressView()
                    .progressViewStyle(.circular)
                Spacer()
            }
        } else {
            content
        }
    }
}
