//
// Created by Maxim Berezhnoy on 2019-02-12.
// Licensed under the MIT license
//
//

import Foundation

extension Http {
    final class Request {
        let urlRequest: URLRequest

        init(from urlRequest: URLRequest) {
            self.urlRequest = urlRequest
        }

        func then(completionHandler: @escaping (Response) -> Void) {
            completionHandler(Response(code: 200))
        }

        func cancel() {
        }
    }
}
