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
public enum Method: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

public typealias Headers = [String: String]

// MARK: - HTTP core
public final class Client {
    public var adapter: RequestAdapter?
    public var retrier: RequestRetrier?

    private let urlSession: URLSession
    private let sessionDelegate: SessionHandling = SessionDelegate()
    private let validator: ResponseValidating

    public static let `default` = {
        Client(configuration: .default)
    }()

    public init(configuration: Configuration, 
                validator: ResponseValidating? = nil) {
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest = configuration.requestTimeout
        sessionConfiguration.httpAdditionalHeaders = configuration.headers
        
        self.validator = validator ?? Validator()

        self.urlSession = URLSession(configuration: sessionConfiguration, delegate: sessionDelegate, delegateQueue: nil)
    }

    public func request(_ url: URL, _ method: Method = .get, body: Data? = nil) -> DataTask {
        // todo: need to test if the headers were actually applied
        let request: Request = {
            let initialRequest = Request(from: URLRequest(url: url, method: method))
            if let adapter = self.adapter {
                return adapter.adapt(request: initialRequest)
            }
            
            return initialRequest
        }()
        
        let urlTask = urlSession.dataTask(with: request.urlRequest)

        let task = DataTask(from: request, wrapping: urlTask) { [weak self] task,
                                                                            response,
                                                                            error,
                                                                            userCompletionHandler in
            guard let `self` = self else { return }

            let result: DataTask.Result = {
                switch self.validator.validate(response: response) {
                case .error(let validationError):
                    return DataTask.Result.error(validationError)
                case .success:
                    return DataTask.Result.success(response)
                }
            }()

            self.sessionDelegate.unregisterTask(task: task)
            
            if let retrier = self.retrier {
                self.request(url, method, body: body)
            } else {
                userCompletionHandler(result)
            }
        }
        
        sessionDelegate.registerTask(task: task)
        
        return task
    }
}

// todo:
// 1. error handling, including authentication, redirection(?), maybe something else
// 2. add a way to inject the dispatcher queue(?)