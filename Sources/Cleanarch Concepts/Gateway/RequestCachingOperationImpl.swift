//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public class RequestCachingOperationImpl<
    Operation: OperationProtocol, Tag
>: TaggedOperation<Operation.Input, Operation.Output, Tag>
where Operation.Input: Equatable {

    private var cachedInput: Operation.Input?
    private var cachedOutput: Operation.Output?

    private let operation: Operation

    public init(operation: Operation) {
        self.operation = operation
    }

    public override func execute(with input: Operation.Input) throws -> Operation.Output {
        if let cachedOutput = cachedOutput, cachedInput == input {
            return cachedOutput
        } else {
            let output = try operation.execute(with: input)
            cachedInput = input
            cachedOutput = output
            return output
        }
    }
}
