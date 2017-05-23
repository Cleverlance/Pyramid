//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import ObjectMapper

public protocol RemoteEndpoint {
    associatedtype Input
    associatedtype InputDto: Mappable
    associatedtype Output
    associatedtype OutputDto: Mappable
    associatedtype ErrorModel: Error
    associatedtype ErrorDto: Mappable

    static var method: RequestMethod { get }
    static var contentType: ContentType { get }
    static var requestHeaders: RequestHeaders? { get }
    static func path(for: Input) -> String
}

public protocol SimpleRemoteEndpoint: RemoteEndpoint {
    static var path: String { get }
}

public extension SimpleRemoteEndpoint {
    public static func path(for _: Input) -> String {
        return path
    }
}
