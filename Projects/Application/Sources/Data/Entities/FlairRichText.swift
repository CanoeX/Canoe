//
// Created by Igor Tarasenko on 2019-02-07.
// Licensed under the MIT license
//

import Foundation

public struct FlairRichText: Codable {
    let type: String?
    let emojiText: String?
    let urlString: String?
    let text: String?

    public enum CodingKeys: String, CodingKey {
        case type = "e"
        case emojiText = "a"
        case urlString = "u"
        case text = "t"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        emojiText = try values.decodeIfPresent(String.self, forKey: .emojiText)
        urlString = try values.decodeIfPresent(String.self, forKey: .urlString)
        text = try values.decodeIfPresent(String.self, forKey: .text)
    }
}
