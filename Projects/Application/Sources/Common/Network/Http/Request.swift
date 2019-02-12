//
// Created by Maxim Berezhnoy on 2019-02-12.
// Licensed under the MIT license
//
//

import Foundation

extension Http {
    final class Request {
        let urlRequest: URLRequest
        
        init(urlRequest: URLRequest) {
            self.urlRequest = urlRequest
        }
        
        func cancel() {
        }
    }
}
