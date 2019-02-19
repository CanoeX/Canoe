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
    // MARK: - Types
    enum Method {
        case get
        case put
        case post
        case delete
    }
    
    typealias Headers = [String: String]

    var adapter: RequestAdapter?
    var retrier: RequestRetrier?

    private let urlSession: URLSession

    static let defaultHeaders: Headers = {
        return [:]
    }()
    
    static let `default` = {
       return Http(configuration: .default)        
    }()
    
    init(configuration: Configuration) {
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest = configuration.requestTimeout
        sessionConfiguration.httpAdditionalHeaders = 
                Http.defaultHeaders.merging(configuration.additionalHeaders) { (_, r) in r }
        
        self.urlSession = URLSession(configuration: sessionConfiguration)
    }

    @discardableResult
    func request(url: URL, _ method: Method = .get, body: Data? = nil) -> Request {
        return Request(urlRequest: URLRequest(url: url))
    }
}