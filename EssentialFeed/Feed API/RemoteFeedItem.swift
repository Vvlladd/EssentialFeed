//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Vlad Toma on 13.09.2024.
//

import Foundation

struct RemoteFeedItem: Decodable {
    let id: UUID
    let description: String?
    let location: String?
    let image: URL
}
