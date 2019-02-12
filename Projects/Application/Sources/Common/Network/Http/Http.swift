//
// Created by Maxim Berezhnoy on 2019-02-12.
// Licensed under the MIT license
//
//

import Foundation

// MARK: - RequestAdapter
protocol RequestAdapter {
    func adapt(urlRequest: URLRequest) -> URLRequest
}

// MARK: - RequestRetrier
protocol RequestRetrier {
    func should(retry request: Http.Request, with response: Http.Response, retryAfter: (TimeInterval) -> Void)
}

// MARK: - Http core
final class Http {
    enum Method {
        case get
        case put
        case post
        case delete
    }
    
    let configuration: Configuration
    
    var adapter: RequestAdapter?
    var retrier: RequestRetrier?
    
    private let urlSessionConfiguration: URLSessionConfiguration 

    init(_ configuration: Configuration) {
        self.configuration = configuration
        

    }

    func request(url: URL, _ method: Method = .get, body: Data? = nil) -> Request {
        return Request(urlRequest: URLRequest(url: url))
    }
}

// MARK: - Http configuration
extension Http {
    struct Configuration {
        let requestTimeout: TimeInterval
    }
}
