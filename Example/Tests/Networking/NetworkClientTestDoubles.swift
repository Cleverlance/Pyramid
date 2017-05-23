//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

@testable import Pyramid

private var dummyResponse = NetworkResponse(
    status: 200,
    headers: ResponseHeaders(),
    body: ResponseDictionary() as ResponseBody
)

class NetworkClientDummy: NetworkClient {
    func request(_ request: NetworkRequest) throws -> NetworkResponse {
        return dummyResponse
    }
}

class NetworkClientSpy: NetworkClient {
    var requests = [NetworkRequest]()

    func request(_ request: NetworkRequest) throws -> NetworkResponse {
        requests.append(request)
        return dummyResponse
    }
}

class NetworkClientThrowing: NetworkClient {
    func request(_ request: NetworkRequest) throws -> NetworkResponse {
        throw TestError()
    }
}

class NetworkClientReturning: NetworkClient {
    fileprivate let response: NetworkResponse
    init(_ response: NetworkResponse) { self.response = response }

    func request(_ request: NetworkRequest) throws -> NetworkResponse {
        return response
    }
}
