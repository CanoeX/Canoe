//
// Created by Igor Tarasenko on 2019-02-12.
// Licensed under the MIT license
//

import Domain
import Foundation
import ReactorKit
import RxSwift

final class FeedViewReactor: Reactor {
    typealias Dependencies = SubredditServiceContainer

    enum LoadingStatus {
        case none
        case loadingNextPage
        case refreshing
    }

    enum Callback {
        case didSelectPost(Post)
    }

    enum Action {
        case viewDidLoad
        case loadNextPage
    }

    enum Mutation {
        case setLoadingStatus(LoadingStatus)
        case setPosts([Post])
    }

    struct State {
        var postReactors: [FeedViewCellReactor] = []
        var loadingStatus: LoadingStatus = .none
    }

    let initialState = State()
    let callback = PublishSubject<Callback>()

    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewDidLoad:
            let startLoading = Observable.just(Mutation.setLoadingStatus(.refreshing))

            let fetchPosts = dependencies.subredditService
                .getPosts(for: "popular")
                .map { Mutation.setPosts($0) }

            let finishLoading = Observable.just(Mutation.setLoadingStatus(.none))
            return .concat(startLoading, fetchPosts, finishLoading)
        case .loadNextPage:
            return .empty()
        }
    }

    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case let .setLoadingStatus(status):
            newState.loadingStatus = status
        case let .setPosts(posts):
            newState.postReactors = posts.map { FeedViewCellReactor(post: $0) }
        }
        return newState
    }
}
