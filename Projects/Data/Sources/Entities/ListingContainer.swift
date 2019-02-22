//
// Created by Igor Tarasenko on 2019-02-07.
// Licensed under the MIT license
//

import Foundation

public enum ListingKind: String, Codable {
    case listing = "Listing"
}

public struct ListingContainer: Codable {
    public let kind: ListingKind
    public let data: Listing
}
