//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

// MARK: Throwing
public protocol OperationProtocol {
    associatedtype Input
    associatedtype Output

    func execute(with input: Input) throws -> Output
}

extension OperationProtocol where Input == Empty {
    public func execute() throws -> Output {
        return try execute(with: Empty())
    }
}

public typealias Operation<Input, Output> = TaggedOperation<Input, Output, Void>

open class TaggedOperation<Input, Output, Tag>: AbstractClass, OperationProtocol {
    public init() {}

    open func execute(with input: Input) throws -> Output { virtualMethod }
}

open func execute(with input: Input) throws -> Output { virtualMethod } }

// MARK: Non-Throwing
public protocol NonThrowingOperationProtocol {
    associatedtype Input
    associatedtype Output
    
    func execute(with input: Input) -> Output
}

extension NonThrowingOperationProtocol where Input == Empty {
    public func execute() -> Output {
        return execute(with: Empty())
    }
}

public typealias NonThrowingOperation<Input, Output> = TaggedNonThrowingOperation<Input, Output, Void>

open class TaggedNonThrowingOperation<Input, Output, Tag>: AbstractClass, NonThrowingOperationProtocol {
    public init() {}

    open func execute(with input: Input) -> Output { virtualMethod }
}
