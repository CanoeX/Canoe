//
// Created by Igor Tarasenko on 2019-02-08.
// Licensed under the MIT license
//

import Foundation
import ReactorKit
import RxCocoa
import RxSwift
import UIKit

final class SplashViewController: BaseViewController<SplashViewReactor, UIView> {
    override func bind(reactor: Reactor) {
        rx
            .methodInvoked(#selector(viewDidAppear))
            .map { _ in Reactor.Action.viewDidAppear }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
}
