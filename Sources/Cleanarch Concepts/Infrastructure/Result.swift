//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public enum Result<Response> {
    case success(response: Response)
    case failure(error: Error)

    public var response: Response? {
        guard case .success(let response) = self else { return nil }
        return response
    }

    public var error: Error? {
        guard case .failure(let error) = self else { return nil }
        return error
    }
}

extension Result {
    public func map<T>(transform: (Response) -> T) -> Result<T> {
        switch self {
        case .success(let response):
            return .success(response: transform(response))
        case .failure(let error):
            return .failure(error: error)
        }
    }
}
