//
// Created by Igor Tarasenko on 2019-02-07.
// Licensed under the MIT license
//

import Foundation
import RxCocoa
import RxSwift

public protocol SubredditDataSource {
    func fetchPosts(for subredditName: String) -> Single<ListingContainer>
}

public final class DefaultSubredditDataSource: SubredditDataSource {
    public init() {}

    public func fetchPosts(for subredditName: String) -> Single<ListingContainer> {
        guard let url = URL(string: "https://www.reddit.com/r/\(subredditName).json") else { return .never() }

        let request = URLRequest(url: url)
        return URLSession.shared.rx
            .data(request: request)
            //.do(onNext: { logger.debug(String(data: $0, encoding: .utf8) ?? "Can't convert data to string") })
            .observeOn(SerialDispatchQueueScheduler(qos: .background))
            .map {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                return try decoder.decode(ListingContainer.self, from: $0)
            }
            .observeOn(MainScheduler.instance)
            .asSingle()
    }
}
