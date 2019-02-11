//
// Created by Igor Tarasenko on 2019-02-11.
// Licensed under the MIT license
//

import UIKit

extension UIViewController {
    func addAndMoveChild(_ viewController: UIViewController) {
        addChild(viewController)
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
    }

    func removeChild(_ viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
}
