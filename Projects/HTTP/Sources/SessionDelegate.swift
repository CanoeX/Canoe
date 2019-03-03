//
// Created by Maxim Berezhnoy on 2019-02-28.
// Licensed under the MIT license
//

import Foundation

internal protocol SessionHandling: URLSessionDelegate {
    typealias URLTaskIdentifier = Int
    var taskDelegates: [URLTaskIdentifier: TaskDelegate] { get }
    
    func registerTask(task: DataTask)
    func unregisterTask(task: DataTask)
}

internal final class SessionDelegate: NSObject, SessionHandling {
    var taskDelegates: [URLTaskIdentifier: TaskDelegate] = [:]

    func registerTask(task: DataTask) {
        taskDelegates[task.urlSessionTask.taskIdentifier] = task
    }

    func unregisterTask(task: DataTask) {
        taskDelegates.removeValue(forKey: task.urlSessionTask.taskIdentifier)
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