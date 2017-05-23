//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

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
