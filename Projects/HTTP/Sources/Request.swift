//
// Created by Maxim Berezhnoy on 2019-02-12.
// Licensed under the MIT license
//

import Foundation

public struct Request {
    public let urlRequest: URLRequest

    public init(from urlRequest: URLRequest) {
        self.urlRequest = urlRequest
    }
}
