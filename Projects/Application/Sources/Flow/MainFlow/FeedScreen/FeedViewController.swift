//
// Created by Igor Tarasenko on 2019-01-31.
// Licensed under the MIT license
//

import ReactorKit
import RxCocoa
import RxSwift
import UIKit
import Utilities

final class FeedViewController: BaseViewController<FeedViewReactor, FeedView>, UITableViewDelegate {
    override func bind(reactor: Reactor) {
        logger.debug("Binding reactor for FeedViewController")

        rx
            .methodInvoked(#selector(viewDidAppear))
            .map { _ in Reactor.Action.viewDidAppear }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)

        currentView.tableView.rx.setDelegate(self).disposed(by: self.disposeBag)

        reactor.state
            .map { $0.postReactors }
            .do(onNext: { posts in logger.debug("Going to display new posts (amount: \(posts.count)") })
            .bind(
                to: currentView.tableView.rx.items(cellIdentifier: FeedViewCell.cellIdentifier)
            ) { (_, reactor: FeedViewCellReactor, cell: FeedViewCell) in
                cell.reactor = reactor
            }
            .disposed(by: disposeBag)

        currentView.tableView.rx.contentOffset
            .filter { [weak self] offset in
                guard let `self` = self else { return false }
                guard self.currentView.tableView.frame.height > 0 else { return false }
                return offset.y + self.currentView.tableView.frame.height
                    >= self.currentView.tableView.contentSize.height - 100
            }
            .map { _ in Reactor.Action.loadNextPage }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let reactor = reactor?.currentState.postReactors[indexPath.row] else { return 40.0 }
        return FeedViewCell.height(fits: currentView.tableView.frame.width, reactor: reactor)
    }
}
