//
// Created by Igor Tarasenko on 2019-01-31.
// Licensed under the MIT license
//

import ReactorKit
import RxCocoa
import RxSwift
import UIKit
import Utilities

final class FeedViewController: BaseViewController<FeedViewReactor, FeedView> {
    override func bind(reactor: Reactor) {
        logger.debug("Binding reactor for FeedViewController")

        rx
            .methodInvoked(#selector(viewDidLoad))
            .map { _ in Reactor.Action.viewDidLoad }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)

        reactor.state
            .map { $0.postReactors }
            .do(onNext: { posts in logger.debug("Going to display new posts (amount: \(posts.count)") })
            .bind(
                to: currentView.tableView.rx.items(cellIdentifier: FeedViewCell.cellIdentifier)
            ) { (_, reactor: FeedViewCellReactor, cell: FeedViewCell) in
                cell.reactor = reactor
            }
            .disposed(by: disposeBag)
    }
}
