//
// Created by Igor Tarasenko on 2019-01-16.
// Licensed under the MIT license
//

import RxCocoa
import RxSwift
import UIKit

final class AppFlowController: UIViewController {
    typealias Dependencies = UserServiceContainer & SubredditServiceContainer

    private let disposeBag = DisposeBag()
    private let dependencies: Dependencies

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
        dependencies.subredditService
            .getPosts(for: "popular")
            .subscribe(
                onNext: { logger.debug($0) },
                onError: { logger.error($0) }
            ).disposed(by: disposeBag)
    }

    func showMainFlow() {
    }
}
