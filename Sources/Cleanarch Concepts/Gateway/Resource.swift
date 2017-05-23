//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

// swiftlint:disable generic_type_name

public protocol ResourceType {
    associatedtype Request
    associatedtype Response
    associatedtype Tag

    func makeRequest(_ request: Request) throws -> Response
}

open class Resource<Request, Response, _Tag>: ResourceType, AbstractClass {
    public typealias Tag = _Tag

    public init() {}

    open func makeRequest(_ request: Request) throws -> Response {
        return markMethodAsVirtual()
    }
}

public extension ResourceType where Request == EmptyRequest {

    public func makeRequest() throws -> Response {
        return try makeRequest(EmptyRequest.instance)
    }
}
