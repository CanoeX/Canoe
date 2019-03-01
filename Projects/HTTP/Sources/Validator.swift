//
// Created by Maxim Berezhnoy on 2019-02-28.
// Licensed under the MIT license
//

import Foundation

internal final class Validator {
    enum Result {
        case success
        case error(Error)
    }

    enum ValidationError: Error {
        case unacceptableStatusCode(Int)
    }
    
    var acceptableStatusCodes = Array(200..<300)
    
    func validate(response: Response) -> Result {
        if !acceptableStatusCodes.contains(response.code) {
            return .error(ValidationError.unacceptableStatusCode(response.code))
        }
        
        return .success
    }
}