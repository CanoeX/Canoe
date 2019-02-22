//
// Created by Igor Tarasenko on 2019-02-12.
// Licensed under the MIT license
//

import ReactorKit
import RxSwift
import UIKit
import Utilities

final class FeedViewCell: UITableViewCell, View {
    static let cellIdentifier = "FeedViewCell"

    typealias Reactor = FeedViewCellReactor

    var disposeBag = DisposeBag()

    override var frame: CGRect {
        didSet {
            updateFrames()
        }
    }

    private lazy var titleLabel = UILabel().then {
        $0.numberOfLines = 2
        $0.font = .preferredFont(forTextStyle: .headline)
    }

    override init(style: CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .white
        contentView.addSubview(titleLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not implemented")
    }

    func bind(reactor: Reactor) {
        titleLabel.text = reactor.currentState.title
        titleLabel.sizeToFit()
    }

    private func updateFrames() {
        titleLabel.frame = contentView.bounds
    }

    static func height(fits width: CGFloat, reactor: Reactor) -> CGFloat {
        return 40.0
    }
}
