//
// Created by Maxim Berezhnoy on 2019-02-12.
// Licensed under the MIT license
//
//

import Foundation

extension Http {
    final class Response {
        let code: Int
        let body: Data?

        init(code: Int, body: Data? = nil) {
            self.code = code
            self.body = body
        }
    }
}
