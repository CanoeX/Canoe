//
// Created by Maxim Berezhnoy on 2019-02-28.
// Licensed under the MIT license
//

import Foundation

internal final class SessionDelegate {
    typealias URLTaskIdentifier = Int
    
    private let taskDelegates: [URLTaskIdentifier: TaskDelegate]
    
    func addNew(task: DataTask) {
        taskDelegates[task.urlSessionTask.taskIdentifier] = task
    }
}

// MARK: - URLSessionDelegate
extension SessionDelegate: URLSessionDelegate {
    
}

// MARK: - URLSessionTaskDelegate
extension SessionDelegate: URLSessionTaskDelegate, URLSessionDataDelegate {
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        taskDelegates[task.taskIdentifier]?.didCompleteWith(error: error)
    }

    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        taskDelegates[dataTask.taskIdentifier]?.didReceive(data: data)
    }
}