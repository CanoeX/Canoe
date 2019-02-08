//
// Created by Igor Tarasenko on 2019-02-07.
// Licensed under the MIT license
//

import Foundation

public struct Listing: Codable {
    public let modhash: String?
    public let dist: Int?
    public let children: [PostContainer]?
    public let after: String?
    public let before: String?
}
