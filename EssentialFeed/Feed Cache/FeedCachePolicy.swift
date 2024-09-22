//
//  FeedCachePolicy.swift
//  EssentialFeed
//
//  Created by Vlad Toma on 22.09.2024.
//


import Foundation

final class FeedCachePolicy {
    private static let maxCacheAgeInDays: Int = 7
    private static let calendar = Calendar(identifier: .gregorian)
    
    private init() {}
        
    static func validate(_ timestamp: Date, against date: Date) -> Bool {
        let calendar = Calendar(identifier: .gregorian)
        guard let maxCacheAge = calendar.date(byAdding: .day, value: maxCacheAgeInDays, to: timestamp) else {
            return false
        }
        return date < maxCacheAge
    }
}
