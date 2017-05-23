//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}

extension Result {
    public var value: Value? {
        guard case .success(let response) = self else { return nil }
        return response
    }

    public var error: Error? {
        guard case .failure(let error) = self else { return nil }
        return error
    }
}
