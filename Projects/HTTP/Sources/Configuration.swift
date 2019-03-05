//
// Created by Maxim Berezhnoy on 2019-02-12.
// Licensed under the MIT license
//

import Foundation
import Utilities

public struct Configuration {
    public static let defaultHeaders: Headers = {
        [:]
    }()

    public static let `default` = Configuration(
        requestTimeout: 1.minutes,
        additionalHeaders: defaultHeaders
    )

    public let requestTimeout: TimeInterval
    private let additionalHeaders: Headers

    public var headers: Headers {
        return Configuration.defaultHeaders.merging(additionalHeaders, uniquingKeysWith: { _, rhs in rhs })
    }
}
