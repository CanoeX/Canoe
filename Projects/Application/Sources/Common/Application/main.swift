//
// Created by Igor Tarasenko
// Licensed under the MIT license
//

import UIKit

let isRunningTests = NSClassFromString("XCTestCase") != nil
let appDelegateClass = isRunningTests ? nil : NSStringFromClass(AppDelegate.self)

// Temporary solution for travis
// UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, appDelegateClass)
_ = UIApplicationMain(
    CommandLine.argc,
    UnsafeMutableRawPointer(CommandLine.unsafeArgv)
        .bindMemory(
            to: UnsafeMutablePointer<Int8>.self,
            capacity: Int(CommandLine.argc)
        ),
    nil,
    appDelegateClass
)
