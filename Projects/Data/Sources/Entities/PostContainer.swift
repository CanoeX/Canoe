//
// Created by Igor Tarasenko on 2019-02-07.
// Licensed under the MIT license
//

import Foundation

public enum PostKind: String, Codable {
    case listing = "t3"
}

public struct PostContainer: Codable {
    public let kind: PostKind
    public let data: Post
}
