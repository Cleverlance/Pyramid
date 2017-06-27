//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol AsyncOperationProtocol {
    associatedtype Input
    associatedtype Output

    func execute(with input: Input, completion: @escaping (OperationResult<Output>) -> Void)
}

extension AsyncOperationProtocol where Input == Empty {
    public func execute(completion: @escaping (OperationResult<Output>) -> Void) {
        execute(with: Empty(), completion: completion)
    }
}

public typealias AsyncOperation<Input, Output> = TaggedAsyncOperation<Input, Output, Void>

open class TaggedAsyncOperation<Input, Output, Tag>: AbstractClass, AsyncOperationProtocol {
    public init() {}

    open func execute(with input: Input, completion: @escaping (OperationResult<Output>) -> Void) {
        virtualMethod
    }
}
