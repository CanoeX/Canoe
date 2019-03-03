//
// Created by Maxim Berezhnoy on 2019-02-28.
// Licensed under the MIT license
//

import Foundation

public enum ValidationResult {
    case success
    case error(Error)
}

public enum ValidationError: Error {
    case unacceptableStatusCode(Int)
}

public protocol ResponseValidating {
    func validate(response: Response) -> ValidationResult
}

internal final class Validator: ResponseValidating {
    var acceptableStatusCodes = Array(200..<300)
    
    func validate(response: Response) -> ValidationResult {
        if !acceptableStatusCodes.contains(response.code) {
            return .error(ValidationError.unacceptableStatusCode(response.code))
        }
        
        return .success
    }
}