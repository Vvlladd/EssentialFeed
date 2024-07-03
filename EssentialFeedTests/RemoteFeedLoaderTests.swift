import XCTest

class RemoteFeedLoader {
    
}

final class HTTPClient {
    var requestedURL: URL?
}

final class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init() {
        let client = HTTPClient()
        let _ = RemoteFeedLoader()
        XCTAssertNil(client.requestedURL)
    }
    
}
