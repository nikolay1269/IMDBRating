//
//  Untitled.swift
//  IMDBRating
//
//  Created by Nikolay - on 23.10.2025.
//
import Foundation

extension TimeInterval {
    func formatDuration() -> String? {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute] // Specify the units to display
        formatter.unitsStyle = .abbreviated // Options include .abbreviated, .short, and .full
        
        // Set padding for single-digit units (e.g., "05h 02m")
        formatter.zeroFormattingBehavior = .pad
        
        return formatter.string(from: self)
    }
}
