//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Result

public typealias OperationResult<Value> = Result<Value, AnyError>

public extension Result where Error == AnyError {
    static func failure(error: Swift.Error) -> Result<Value, Error> {
        return .failure(AnyError(error))
    }
}
