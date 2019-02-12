//
// Created by Igor Tarasenko on 2019-01-16.
// Licensed under the MIT license
//

import Domain
import RxCocoa
import RxSwift
import UIKit

final class AppFlowController: UIViewController {
    typealias Dependencies = UserServiceContainer & SubredditServiceContainer

    private let disposeBag = DisposeBag()
    private let dependencies: Dependencies

    private var currentChildViewController: UIViewController?

    init(dependencies: Dependencies) {
        self.dependencies = dependencies

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not implemented")
    }

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

        addAndMoveChild(viewController)
    }

    func showMainFlow() {
        removeCurrentChildViewController()

        dependencies.subredditService
            .getPosts(for: "popular")
            .subscribe(
                onNext: { logger.debug($0) },
                onError: { logger.error($0) }
            ).disposed(by: disposeBag)
    }

    func removeCurrentChildViewController() {
        guard let viewController = currentChildViewController else { return }

        removeChild(viewController)
    }
}
