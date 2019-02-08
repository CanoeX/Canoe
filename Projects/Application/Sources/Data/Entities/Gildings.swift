//
// Created by Igor Tarasenko on 2019-02-07.
// Licensed under the MIT license
//

import Foundation

public struct Gildings: Codable {
    public let silver: Int?
    public let gold: Int?
    public let platinum: Int?

    public enum CodingKeys: String, CodingKey {
        case silver = "gid_1"
        case gold = "gid_2"
        case platinum = "gid_3"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        silver = try values.decodeIfPresent(Int.self, forKey: .silver)
        gold = try values.decodeIfPresent(Int.self, forKey: .gold)
        platinum = try values.decodeIfPresent(Int.self, forKey: .platinum)
    }
}
