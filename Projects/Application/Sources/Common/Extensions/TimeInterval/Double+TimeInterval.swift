//
// Created by Maxim Berezhnoy on 2019-02-12.
// Licensed under the MIT license
//
//

import Foundation

extension Double {
    var milliseconds: TimeInterval {
        return TimeInterval(self / 1000)    
    }
    
    var seconds: TimeInterval {
        return TimeInterval(self)
    }
    
    var minutes: TimeInterval {
        return TimeInterval(self * 60)
    }
    
    var hours: TimeInterval {
        return TimeInterval(self.minutes * 60)
    }
}