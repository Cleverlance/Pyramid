//
//  Copyright © 2015 Cleverlance. All rights reserved.
//

internal enum NetworkClientError: Error {
    case networkConnectionError
    case serverError
    case authenticationError
}

public protocol NetworkClient {
    func request(_ request: NetworkRequest) throws -> NetworkResponse
}
