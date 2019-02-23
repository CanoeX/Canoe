//
// Created by Maxim Berezhnoy on 2019-02-12.
// Licensed under the MIT license
//

import Foundation

public extension Double {
    public var milliseconds: TimeInterval {
        return TimeInterval(self / 1000)
    }

    public var seconds: TimeInterval {
        return TimeInterval(self)
    }

    public var minutes: TimeInterval {
        return TimeInterval(self * 60)
    }

    public var hours: TimeInterval {
        return TimeInterval(self.minutes * 60)
    }
}
