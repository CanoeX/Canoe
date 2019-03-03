//
// Created by Maxim Berezhnoy on 2019-03-03.
// Licensed under the MIT license
//

import Foundation

extension URLRequest {
    public init(url: URL, method: Method) {
        self.init(url: url)

        httpMethod = method.rawValue
    }
}