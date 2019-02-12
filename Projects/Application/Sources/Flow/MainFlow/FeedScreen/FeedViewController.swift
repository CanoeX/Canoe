//
// Created by Igor Tarasenko on 2019-01-31.
// Licensed under the MIT license
//

import ReactorKit
import RxCocoa
import RxSwift
import UIKit

final class FeedViewController: UIViewController, View {
    typealias Reactor = FeedViewReactor

    var disposeBag = DisposeBag()

    init(reactor: Reactor) {
        super.init(nibName: nil, bundle: nil)

        self.reactor = reactor
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not implemented")
    }

    func bind(reactor: Reactor) {
        rx
            .methodInvoked(#selector(viewDidLoad))
            .map { _ in Reactor.Action.viewDidLoad }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    override func loadView() {
        view = FeedView()
    }
}
