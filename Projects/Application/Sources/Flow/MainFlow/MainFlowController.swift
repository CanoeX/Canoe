//
// Created by Igor Tarasenko on 2019-02-08.
// Licensed under the MIT license
//

import RxCocoa
import RxSwift
import UIKit

final class MainFlowController: UIViewController {
    typealias Dependencies = SubredditServiceContainer

    private let disposeBag = DisposeBag()
    private let dependencies: Dependencies

    private let embedNavigationController = UINavigationController()

    init(dependencies: Dependencies) {
        self.dependencies = dependencies

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        addAndMoveChild(embedNavigationController)
    }
}
