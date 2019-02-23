//
// Created by Maxim Berezhnoy on 2019-02-12.
// Licensed under the MIT license
//

import Foundation

public final class Task {
    public let request: Request

    public init(from request: Request) {
        self.request = request
    }

    public func then(completionHandler: @escaping (Response) -> Void) {
        completionHandler(Response(code: 200))
    }

    public func cancel() {
    }
}
