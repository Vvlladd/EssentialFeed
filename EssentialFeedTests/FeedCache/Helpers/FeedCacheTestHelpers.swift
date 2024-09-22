//
//  FeedCacheTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Vlad Toma on 22.09.2024.
//

import Foundation
import EssentialFeed

 func uniqueImageFeed() -> (models: [FeedImage], local: [LocalFeedImage]) {
    let models = [uniqueImage(), uniqueImage()]
    let local = models.map { LocalFeedImage(id: $0.id, description: $0.description, location: $0.location, url: $0.url) }
    return (models, local)
}

 func uniqueImage()  -> FeedImage {
    FeedImage(id: UUID(),
             description: "any",
             location: "some locatioin",
             url: anyURL())
}

extension Date {
    func minusFeedCacheMaxAge() -> Date {
        return adding(days: -7)
    }
    func adding(days: Int) -> Date {
        return Calendar(identifier: .gregorian).date(byAdding: .day, value: days, to: self)!
    }
    
    func adding(seconds: TimeInterval) -> Date {
        return self + seconds
    }
}
