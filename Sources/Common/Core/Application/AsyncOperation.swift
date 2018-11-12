//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol AsyncOperationProtocol {
    associatedtype Input
    associatedtype Output

    @discardableResult
    func execute(with input: Input, completion: @escaping (OperationResult<Output>) -> Void) -> Execution?
}

extension AsyncOperationProtocol where Input == Empty {
    @discardableResult
    public func execute(completion: @escaping (OperationResult<Output>) -> Void) -> Execution? {
        return execute(with: Empty(), completion: completion)
    }
}

public typealias AsyncOperation<Input, Output> = TaggedAsyncOperation<Input, Output, Void>

open class TaggedAsyncOperation<Input, Output, Tag>: AbstractClass, AsyncOperationProtocol {
    public init() {}

    @discardableResult
    open func execute(with input: Input, completion: @escaping (OperationResult<Output>) -> Void) -> Execution? {
        virtualMethod
    }
}

public protocol Execution {
    func cancel()
}
