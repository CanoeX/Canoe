//
// Created by Igor Tarasenko on 2019-01-16.
// Licensed under the MIT license
//

import UIKit

final class AppFlowController: UIViewController {
    typealias Dependencies = UserServiceContainer

    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not implemented")
    }

    func showSplashScreen() {
    }

    func showMainFlow() {
    }
}
