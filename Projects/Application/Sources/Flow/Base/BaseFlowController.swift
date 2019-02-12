//
// Created by Igor Tarasenko on 2019-02-12.
// Licensed under the MIT license
//

import UIKit
import class RxSwift.DisposeBag

class BaseFlowController<Dependencies>: UIViewController {
    let disposeBag = DisposeBag()
    let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not implemented")
    }
}
