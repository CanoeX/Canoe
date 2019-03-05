//
// Created by Maxim Berezhnoy on 2019-02-12.
// Licensed under the MIT license
//

import Foundation

// MARK: - RequestAdapter
public protocol RequestAdapter {
    func adapt(request: Request) -> Request
}

// MARK: - RequestRetrier
public protocol RequestRetrier {
    func should(retry request: Request, with response: Response, retryAfter: (TimeInterval) -> Void)
}

// MARK: - HTTP methods
public enum Method {
    case get
    case put
    case post
    case delete
}

public typealias Headers = [String: String]

// MARK: - HTTP core
public final class Client {
    public var adapter: RequestAdapter?
    public var retrier: RequestRetrier?

    private let urlSession: URLSession

    public static let `default` = {
        Client(configuration: .default)
    }()

    public init(configuration: Configuration) {
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest = configuration.requestTimeout
        sessionConfiguration.httpAdditionalHeaders = configuration.headers

        self.urlSession = URLSession(configuration: sessionConfiguration)
    }

    public func request(_ url: URL, _ method: Method = .get, body: Data? = nil) -> Task {
        let request = Request(from: URLRequest(url: url))
        return Task(from: request)
    }
}
