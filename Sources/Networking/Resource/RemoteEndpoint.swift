//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol RemoteEndpoint {
    associatedtype Input
    static func path(for: Input) -> String

    static var method: RequestMethod { get }
    static var contentType: ContentType { get }
    static var requestHeaders: RequestHeaders? { get }
}

public extension RemoteEndpoint {
    static var contentType: ContentType {
        switch method {
        case .post, .put, .delete: return .json
        case .get: return .wwwFormUrlEncoded
        }
    }
    static var requestHeaders: RequestHeaders? { return ["format": "json"] }
}

public protocol SimpleRemoteEndpoint: RemoteEndpoint {
    static var path: String { get }
}

public extension SimpleRemoteEndpoint {
    public static func path(for _: Input) -> String {
        return path
    }
}
