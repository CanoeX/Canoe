//
// Created by Igor Tarasenko on 2019-02-12.
// Licensed under the MIT license
//

import ReactorKit
import RxCocoa
import RxSwift
import UIKit

class BaseViewController<ViewReactor: Reactor, V: UIView>: UIViewController, View {
    typealias Reactor = ViewReactor

    var disposeBag = DisposeBag()
    lazy var currentView = V()

    init(reactor: Reactor) {
        super.init(nibName: nil, bundle: nil)

        self.reactor = reactor
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not implemented")
    }

    func bind(reactor: Reactor) {
    }

    override func loadView() {
        view = currentView
    }
}
