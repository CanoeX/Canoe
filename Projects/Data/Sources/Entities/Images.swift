//
// Created by Igor Tarasenko on 2019-02-07.
// Licensed under the MIT license
//

import Foundation

public struct Images: Codable {
    public let source: Resolution?
    public let resolutions: [Resolution]?
    public let variants: Variants?
    public let id: String?
}
