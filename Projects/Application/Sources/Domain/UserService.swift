//
// Created by Igor Tarasenko on 2019-01-17.
// Licensed under the MIT license
//

public protocol UserService {
}

public protocol UserServiceContainer {
    var userService: UserService { get }
}

final class DefaultUserService: UserService {
    init() {}
}
