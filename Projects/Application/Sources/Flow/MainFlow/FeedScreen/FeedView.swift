//
// Created by Igor Tarasenko on 2019-02-05.
// Licensed under the MIT license
//

import UIKit
import Utilities

final class FeedView: UIView {
    lazy var tableView = UITableView().then {
        $0.separatorStyle = .none
        $0.register(FeedViewCell.self, forCellReuseIdentifier: FeedViewCell.cellIdentifier)
    }

    override var frame: CGRect {
        didSet {
            tableView.frame = bounds
        }
    }

    init() {
        super.init(frame: .zero)

        backgroundColor = .white
        addSubview(tableView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not implemented")
    }
}
