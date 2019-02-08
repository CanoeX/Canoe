//
// Created by Igor Tarasenko on 2019-02-05.
// Licensed under the MIT license
//

import UIKit

final class FeedView: UIView {
    private lazy var collectionView: UICollectionView = createCollectionView()

    private func createCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        return collectionView
    }
}
