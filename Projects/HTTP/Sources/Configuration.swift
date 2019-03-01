//
// Created by Maxim Berezhnoy on 2019-02-12.
// Licensed under the MIT license
//

import Foundation
import UIKit
import Utilities

public struct Configuration {
    // TODO: Reddit API client that will use this HTTP module has to additionally specify the reddit username of the app developer
    public static let defaultHeaders: Headers = {
        let acceptEncoding = "gzip;q=1.0, compress;q=0.5"

        let acceptLanguage = Locale.preferredLanguages.prefix(10).enumerated().map { i, langCode in
            let quality = 1.0 - Double(i) * 0.1
            return "\(langCode);q=\(quality)"
        }.joined(separator: ", ")

        let userAgent: String = {
            guard let bundleInfo = Bundle.main.infoDictionary else {
                return "Canoe"
            }

            let appVersion = bundleInfo["CFBundleShortVersionString"] as? String ?? "Unknown app version"
            let bundle = bundleInfo[kCFBundleIdentifierKey as String] as? String ?? "Unknown"
            let deviceName = UIDevice.current.model
            let osName = UIDevice.current.systemName
            let osVersion = UIDevice.current.systemVersion

            // Example: iOS (9.0, iPhone):com.canoex.canoe:1.0
            return "\(osName) (\(osVersion), \(deviceName)):\(bundle):\(appVersion)"
        }()

        return [
            "Accept-Encoding": acceptEncoding,
            "Accept-Language": acceptLanguage,
            "User-Agent": userAgent
        ]
    }()

    public static let `default` = Configuration(
            requestTimeout: 1.minutes,
            additionalHeaders: defaultHeaders
    )

    public let requestTimeout: TimeInterval
    private let additionalHeaders: Headers

    public var headers: Headers {
        return Configuration.defaultHeaders.merging(additionalHeaders, uniquingKeysWith: { _, r in r })
    }
}
