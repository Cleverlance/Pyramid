//
//  Copyright © 2015 Cleverlance. All rights reserved.
//

public typealias RequestHeaders = [String: String]
public typealias RequestParameters = [String: Any]

public struct NetworkRequest {
    public let url: String
    public let method: RequestMethod
    public let contentType: ContentType
    public let headers: RequestHeaders?
    public let params: RequestParameters?

    public init(
        url: String,
        method: RequestMethod,
        contentType: ContentType,
        headers: RequestHeaders?,
        params: RequestParameters?
    ) {
        self.url = url
        self.method = method
        self.contentType = contentType
        self.headers = headers
        self.params = params
    }
}
