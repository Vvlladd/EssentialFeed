//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Vlad Toma on 22.09.2024.
//

import Foundation

func anyURL() -> URL {
   URL(string: "https://any-url.com")!
}

func anyNSError() -> NSError {
   return NSError(domain: "any error", code: 0)
}
