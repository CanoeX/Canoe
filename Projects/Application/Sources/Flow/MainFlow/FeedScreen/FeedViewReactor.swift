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

    enum Callback {
    }

    enum Action {
        case viewDidLoad
    }

    enum Mutation {
    }

    struct State {
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
            return .empty()
        }
    }
}
