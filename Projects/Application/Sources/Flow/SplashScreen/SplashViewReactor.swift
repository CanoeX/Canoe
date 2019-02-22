//
// Created by Igor Tarasenko on 2019-02-08.
// Licensed under the MIT license
//

import Foundation
import ReactorKit
import RxSwift

final class SplashViewReactor: Reactor {
    enum Callback {
        case didFinishLoading
    }

    enum Action {
        case viewDidAppear
    }

    typealias Mutation = NoMutation

    struct State {
    }

    let initialState = State()
    let callback = PublishSubject<Callback>()

    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewDidAppear:
            callback.onNext(.didFinishLoading)
            return .empty()
        }
    }
}
