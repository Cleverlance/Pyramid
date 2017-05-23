//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public class OperationSpy<Input, Output: DummyCreatable, Tag>: TaggedOperation<Input, Output, Tag> {
    public var inputs = [Input]()

    public override func execute(with input: Input) throws -> Output {
        inputs.append(input)
        return Output.dummy
    }
}

class OperationDummy<Input, Output: DummyCreatable, Tag>: TaggedOperation<Input, Output, Tag> {
    override func execute(with input: Input) throws -> Output {
        return Output.dummy
    }
}

class OperationThrowing<Input, Output, Tag>: TaggedOperation<Input, Output, Tag> {
    private var error: Error

    init(_ error: Error = TestError()) {
        self.error = error
    }

    override func execute(with input: Input) throws -> Output {
        throw error
    }
}

class OperationReturning<Input, Output, Tag>: TaggedOperation<Input, Output, Tag> {
    private var value: Output

    init(_ value: Output) {
        self.value = value
    }

    override func execute(with input: Input) throws -> Output {
        return value
    }
}

class OperationFake<Input, Output, Tag>: TaggedOperation<Input, Output, Tag> {
    private let closure: (Input) -> Output
    init(_ closure: @escaping (Input) -> Output) { self.closure = closure }

    override func execute(with input: Input) throws -> Output {
        return closure(input)
    }
}

extension TaggedOperation {
    public static func throwing(_ error: Error = TestError())
    -> TaggedOperation<Input, Output, Tag> {
        return OperationThrowing(error)
    }

    public static func returning(_ value: Output) -> TaggedOperation<Input, Output, Tag> {
        return OperationReturning(value)
    }

    public static func fake(_ closure: @escaping (Input) -> Output) -> TaggedOperation<Input, Output, Tag> {
        return OperationFake(closure)
    }
}

extension TaggedOperation where Output: DummyCreatable {
    public static func spy() -> OperationSpy<Input, Output, Tag> {
        return OperationSpy()
    }

    public static func dummy() -> TaggedOperation<Input, Output, Tag> {
        return OperationDummy()
    }
}
