//
// Created by Maxim Berezhnoy on 2019-02-12.
// Licensed under the MIT license
//
//

import Foundation

extension Http {
    struct Configuration {
        let requestTimeout: TimeInterval
        let additionalHeaders: Headers

        static let defaultHeaders: Headers = {
            [:]
        }()

        static let `default` = Configuration(
                requestTimeout: 1.minutes,
                additionalHeaders: defaultHeaders
        )
    }
}
