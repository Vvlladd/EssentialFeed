//
//  CacheFeedUseCase.swift
//  EssentialFeedTests
//
//  Created by Vlad Toma on 11.09.2024.
//

import XCTest

final class LocalFeedLoader {
    init(store: FeedStore) {
        
    }
}

final class FeedStore {
    var deleteCachedFeedCallCount = 0
}

final class CacheFeedUseCase: XCTestCase {
    
    func test_init_doesNotDeleteCacheUponCreation() {
        let store = FeedStore()
        _ = LocalFeedLoader(store: store)
        
        XCTAssertEqual(store.deleteCachedFeedCallCount, 0)
    }
}
