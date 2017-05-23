//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol CommandType: CustomStringConvertible {
    associatedtype Receiver
    associatedtype Request
    associatedtype Response

    var request: Request { get }

    init(receiver: Receiver, request: Request, completion: @escaping (Result<Response>) -> Void)
    func execute() throws -> Response
    func complete(_ result: Result<Response>)
}

extension CommandType {
    public var description: String {
        return "\(type(of: self)) \(request)"
    }
}
