//
// Created by Maxim Berezhnoy on 2019-02-12.
// Licensed under the MIT license
//
//

import Foundation
import RxSwift

extension Http.Request: ReactiveCompatible {
}

extension Reactive where Base: Http.Request {
}
