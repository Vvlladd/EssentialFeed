//
//  CoreDataFeedStore.swift
//  EssentialFeed
//
//  Created by Vlad Toma on 08.10.2024.
//

import Foundation

final public class CoreDataFeedStore: FeedStore {
    
    public init() {}

    public func retrieve(completion: @escaping RetrievalCompletion) {
        completion(.empty)
    }

    public func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {

    }

    public func deleteCachedFeed(completion: @escaping DeletionCompletion) {

    }
}
