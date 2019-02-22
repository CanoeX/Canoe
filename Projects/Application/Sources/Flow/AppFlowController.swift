//
// Created by Igor Tarasenko on 2019-01-16.
// Licensed under the MIT license
//

import Domain
import RxCocoa
import RxSwift
import UIKit
import Utilities

final class AppFlowController: BaseFlowController<UserServiceContainer & SubredditServiceContainer> {
    private var currentChildViewController: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        showSplashScreen()
    }

    func showSplashScreen() {
        removeCurrentChildViewController()

        let reactor = SplashViewReactor()
        reactor.callback
            .bind { [weak self] callback in
                switch callback {
                case .didFinishLoading:
                    self?.showMainFlow()
                }
            }
            .disposed(by: disposeBag)

        let viewController = SplashViewController(reactor: reactor)

        setAsCurrentChild(viewController)
    }

    func showMainFlow() {
        removeCurrentChildViewController()

        let viewController = MainFlowController(dependencies: dependencies)
        setAsCurrentChild(viewController)
    }

    func setAsCurrentChild(_ viewController: UIViewController) {
        addAndMoveChild(viewController)

        currentChildViewController = viewController
        logger.debug("Did set current child to \(viewController)")
    }

    func removeCurrentChildViewController() {
        guard let viewController = currentChildViewController else { return }
        logger.debug("Removing current child \(viewController)")

        viewController.removeChildFromParent()
    }
}
