//
// Created by Maxim Berezhnoy on 2019-02-12.
// Licensed under the MIT license
//

import Foundation

internal protocol TaskDelegate {
    func didReceive(data: Data)
    func didCompleteWith(error: Error?)
}

public final class DataTask {
    public enum Result {
        case success(Response)
        case error(Error)
    }
    
    public typealias CompletionHandler = (Result) -> Void

    public let request: Request
    public let urlSessionTask: URLSessionDataTask
    
    internal typealias TaskFinishedHandler = (_ response: Response, _ error: Error?, _ taskCompletionHandler: CompletionHandler) -> Void
    internal var onTaskFinished: TaskFinishedHandler?

    private var accumulatedData: Data? = nil
    private var onUrlTaskFinished: (_ response: HTTPURLResponse, _ error: Error?) -> Void = {_, _ in}

    public init(from request: Request, 
                wrapping task: URLSessionDataTask) {
        self.request = request
        self.urlSessionTask = task
        
//        start()
    }

    public func then(completionHandler: @escaping CompletionHandler) {
        self.onUrlTaskFinished = { [weak self] response, error in
            guard let `self` = self else { return }
            self.onTaskFinished?(Response(code: response.statusCode, body: self.accumulatedData), error, completionHandler)
        }
        
        // todo: for now, start the request only when it's "subscribed" to. Later find out a way to thread-safely assign completion handler
        self.start()
    }

    public func cancel() {
        urlSessionTask.cancel()
    }

    private func start() {
        urlSessionTask.resume()
    }
}

// MARK: - TaskDelegate
extension DataTask: TaskDelegate {
    func didCompleteWith(error: Error?) {
        guard let response = urlSessionTask.response as? HTTPURLResponse else { return } 
        onUrlTaskFinished(response, error)
    }

    func didReceive(data: Data) {
        if accumulatedData == nil {
            accumulatedData = data
        } else {
            accumulatedData?.append(data)
        }
    }
}