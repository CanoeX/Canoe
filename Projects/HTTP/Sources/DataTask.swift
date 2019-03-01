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
    public let request: Request
    public let urlSessionTask: URLSessionDataTask
    
    private var accumulatedData: Data? = nil

    public init(from request: Request, wrapping task: URLSessionDataTask) {
        self.urlSessionTask = task
        start()
    }

    public func then(completionHandler: @escaping (Response, Error?) -> Void) {
        // perhaps the alamofire way - execute through the queue
        completionHandler(Response(code: 200))
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
        let statusCode = -1
        
        if let response = urlSessionTask.response as? HTTPURLResponse {
            statusCode = response.statusCode
        }
        
        let response = Response(statusCode, accumulatedData)
    }

    func didReceive(data: Data) {
        if accumulatedData == nil {
            accumulatedData = data
        } else {
            accumulatedData?.append(data)
        }
    }
}