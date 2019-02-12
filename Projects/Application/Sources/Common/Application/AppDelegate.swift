//
// Created by Igor Tarasenko
// Licensed under the MIT license
//

import UIKit
import Utilities

var logger = Utilities.logger

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    private let dependencies: CompositionRoot = .resolve()
    private lazy var appFlowController = AppFlowController(dependencies: dependencies)

    func application(
        _: UIApplication,
        didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = appFlowController
        window?.makeKeyAndVisible()
        return true
    }
}
