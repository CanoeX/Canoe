//
// Created by Maxim Berezhnoy on 2019-02-12.
// Licensed under the MIT license
//

import Foundation
import RxSwift

extension DataTask: ReactiveCompatible {
}

public extension Reactive where Base: DataTask {
    public func then() -> Single<Response> {
        return Single.create { observer in
            self.base.then { result in
                switch result {
                case .success(let response):
                    observer(.success(response))
                case .error(let error):
                    observer(.error(error))
                }
            }

            return Disposables.create {
                self.base.cancel()
            }
        }
    }
}
