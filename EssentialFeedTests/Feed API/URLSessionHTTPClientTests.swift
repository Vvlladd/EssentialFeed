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
            session.dataTask(with: url) {_,_,_ in }.resume()
        }
        
    }
    
    func test_getFromURL_createsDataTestWithURL() {
        let url = URL(string: "https://any-url.com")!
        let session = URLSessionSpy()
        let sut = URLSessionHTTPClient(session: session)
        
        sut.get(from: url)
        
        XCTAssertEqual(session.receivedURLs, [url])
    }
    
    func test_getFromURL_resumesDataTaskWithURL() {
        let url = URL(string: "https://any-url.com")!
        let session = URLSessionSpy()
        let task = URLSessionDataTaskSpy()
        let sut = URLSessionHTTPClient(session: session)
        session.stub(url: url, task: task)
        
        sut.get(from: url)
        
        XCTAssertEqual(task.resumeCallCount, 1)
    }
    // MARK: - Helpers
    
    private final class URLSessionSpy: URLSession {
        var receivedURLs = [URL]()
        
        private var stubs = [URL: URLSessionDataTask]()
        
        func stub(url: URL, task: URLSessionDataTask) {
            stubs[url] = task
        }
        
        override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, (any Error)?) -> Void) -> URLSessionDataTask {
            receivedURLs.append(url)
            return stubs[url] ?? FakeURLSessionDataTask()
        }
    }
    
    private class FakeURLSessionDataTask: URLSessionDataTask {}
    
    private class URLSessionDataTaskSpy: URLSessionDataTask {
        var resumeCallCount = 0
        
        override func resume() {
            resumeCallCount += 1
        }
    }
}
