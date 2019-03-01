//
// Created by Maxim Berezhnoy on 2019-02-12.
// Licensed under the MIT license
//

import Foundation
import RxSwift

extension Client: ReactiveCompatible {
}

public extension Reactive where Base: Client {
    public func request(_ url: URL, _ method: Method = .get, body: Data? = nil) -> Reactive<DataTask> {
        return base.request(url, method, body: body).rx
    }
}
