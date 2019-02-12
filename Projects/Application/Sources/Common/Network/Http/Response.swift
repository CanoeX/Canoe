//
// Created by Maxim Berezhnoy on 2019-02-12.
// Licensed under the MIT license
//
//

import Foundation

extension Http {
    final class Response {
        let httpUrlResponse: HTTPURLResponse
        let body: Data?

        init(httpUrlResponse: HTTPURLResponse, body: Data? = nil) {
            self.httpUrlResponse = httpUrlResponse
            self.body = body;
        }
    }
}