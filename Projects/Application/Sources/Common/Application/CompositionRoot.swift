//
// Created by Igor Tarasenko on 2019-01-17.
// Licensed under the MIT license
//

final class CompositionRoot: UserServiceContainer, SubredditServiceContainer {
    lazy var userService: UserService = {
        DefaultUserService()
    }()

    lazy var subredditService: SubredditService = {
        let dataSource = DefaultSubredditDataSource()
        return DefaultSubredditService(dataSource: dataSource)
    }()

    private init() {}

    static func resolve() -> CompositionRoot {
        return CompositionRoot()
    }
}
