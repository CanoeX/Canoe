//
// Created by Igor Tarasenko on 2019-02-07.
// Licensed under the MIT license
//

import Data
import Foundation
import RxSwift

public protocol SubredditService {
    func getPosts(for subredditName: String) -> Observable<ListingContainer>
}

public protocol SubredditServiceContainer {
    var subredditService: SubredditService { get }
}

public final class DefaultSubredditService: SubredditService {
    private let dataSource: SubredditDataSource

    public init(dataSource: SubredditDataSource) {
        self.dataSource = dataSource
    }

    public func getPosts(for subredditName: String) -> Observable<ListingContainer> {
        return dataSource.fetchPosts(for: subredditName).asObservable()
    }
}
