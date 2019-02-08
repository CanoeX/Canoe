//
// Created by Igor Tarasenko on 2019-02-08.
// Licensed under the MIT license
//

import Foundation
import ReactorKit
import RxCocoa
import RxSwift
import UIKit

final class SplashViewController: UIViewController, View {
    typealias Reactor = SplashViewReactor

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
}
