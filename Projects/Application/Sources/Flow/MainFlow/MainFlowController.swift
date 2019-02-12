//
// Created by Igor Tarasenko on 2019-02-08.
// Licensed under the MIT license
//

import Domain
import RxCocoa
import RxSwift
import UIKit

final class MainFlowController: BaseFlowController<SubredditServiceContainer> {
    private let embedNavigationController = UINavigationController()

    override func viewDidLoad() {
        super.viewDidLoad()

        addAndMoveChild(embedNavigationController)
        showFeed()
    }

    private func showFeed() {
        let reactor = FeedViewReactor(dependencies: dependencies)
        let viewController = FeedViewController(reactor: reactor)

        embedNavigationController.pushViewController(viewController, animated: false)
    }
}
