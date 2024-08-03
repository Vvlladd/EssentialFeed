//
//  URLSessionHTTPClientTests.swift
//  EssentialFeedTests
//
//  Created by Vlad Toma on 27.07.2024.
//

import XCTest

final class URLSessionHTTPClientTests: XCTestCase {
    
    final class URLSessionHTTPClient {
        private let session: URLSession
        
        init(session: URLSession) {
            self.session = session
        }
        
        func get(from url: URL) {
            session.dataTask(with: url) {_,_,_ in }
        }
        
    }
    
    func test_getFromURL_createsDataTestWithURL() {
        let url = URL(string: "https://any-url.com")!
        let session = URLSessionSpy()
        let sut = URLSessionHTTPClient(session: session)
        
        sut.get(from: url)
        
        XCTAssertEqual(session.receivedURLs, [url])
    }
    // MARK: - Helpers
    
    private final class URLSessionSpy: URLSession {
        var receivedURLs = [URL]()
        
        override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, (any Error)?) -> Void) -> URLSessionDataTask {
            receivedURLs.append(url)
            return URLSession.shared.dataTask(with: url)
        }
    }
}
