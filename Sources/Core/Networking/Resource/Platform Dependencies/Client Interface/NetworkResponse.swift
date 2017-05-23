//
//  Copyright © 2015 Cleverlance. All rights reserved.
//

public typealias Status = Int
public typealias ResponseHeaders = [String: String]
public typealias ResponseBody = Any

public struct NetworkResponse {
    public let status: Status
    public let headers: ResponseHeaders?
    public let body: ResponseBody?

    public init(status: Status, headers: ResponseHeaders?, body: ResponseBody?) {
        self.status = status
        self.headers = headers
        self.body = body
    }
}

public typealias ResponseDictionary = [String: Any]
public typealias ResponseArray = [Any]

extension NetworkResponse {
    public var bodyArray: ResponseArray? {
        return self.body as? ResponseArray
    }

    public var bodyDictionary: ResponseDictionary? {
        return self.body as? ResponseDictionary
    }
}
