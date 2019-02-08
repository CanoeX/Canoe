//
// Created by Igor Tarasenko on 2019-02-07.
// Licensed under the MIT license
//

import Foundation
import RxSwift

public protocol SubredditService {
    func getPosts(for subredditName: String) -> Observable<ListingContainer>
}

public protocol SubredditServiceContainer {
    var subredditService: SubredditService { get }
}

final class DefaultSubredditService: SubredditService {
    private let dataSource: SubredditDataSource

    init(dataSource: SubredditDataSource) {
        self.dataSource = dataSource
    }

    func getPosts(for subredditName: String) -> Observable<ListingContainer> {
        return dataSource.fetchPosts(for: subredditName).asObservable()
    }
}
