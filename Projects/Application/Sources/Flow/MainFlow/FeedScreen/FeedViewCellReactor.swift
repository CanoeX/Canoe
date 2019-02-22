//
// Created by Igor Tarasenko on 2019-02-12.
// Licensed under the MIT license
//

import struct Domain.Post
import Foundation
import ReactorKit
import RxSwift

final class FeedViewCellReactor: Reactor {
    typealias Action = NoAction

    let initialState: Post

    init(post: Post) {
        initialState = post
    }
}
