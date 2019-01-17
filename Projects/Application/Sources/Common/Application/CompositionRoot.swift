//
// Created by Igor Tarasenko on 2019-01-17.
// Licensed under the MIT license
//

final class CompositionRoot: UserServiceContainer {
    lazy var userService: UserService = {
        DefaultUserService()
    }()

    private init() {}

    static func resolve() -> CompositionRoot {
        return CompositionRoot()
    }
}
