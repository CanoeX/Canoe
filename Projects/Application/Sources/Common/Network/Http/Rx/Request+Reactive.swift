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
    func then() -> Single<Http.Response> {
        return Observable<Http.Response>.create { observer in
            self.base.then { response in
                observer.on(.next(response))
                observer.onCompleted()
            }

            return Disposables.create {
                self.base.cancel()
            }
        }.asSingle()
    }
}
