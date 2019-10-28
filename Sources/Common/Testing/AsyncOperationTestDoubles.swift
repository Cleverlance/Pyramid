//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

class AsyncOperationDummy<Input, Output, Tag>: TaggedAsyncOperation<Input, Output, Tag> {
    override func execute(with input: Input, completion: @escaping (OperationResult<Output>) -> Void) -> Execution? {
        return nil
    }
}

public class AsyncOperationSpy<Input, Output, Tag>: TaggedAsyncOperation<Input, Output, Tag> {
    public var inputs = [Input]()

    override public func execute(
        with input: Input,
        completion: @escaping (OperationResult<Output>) -> Void
    ) -> Execution? {
        inputs.append(input)
        return nil
    }
}

class AsyncOperationThrowing<Input, Output, Tag>: TaggedAsyncOperation<Input, Output, Tag> {
    fileprivate let error: Error

    init(_ error: Error) {
        self.error = error
    }

    override func execute(with input: Input, completion: @escaping (OperationResult<Output>) -> Void) -> Execution? {
        completion(.failure(error))
        return nil
    }
}

class AsyncOperationReturning<Input, Output, Tag>: TaggedAsyncOperation<Input, Output, Tag> {
    fileprivate let value: Output

    init(_ value: Output) {
        self.value = value
    }

    override func execute(with input: Input, completion: @escaping (OperationResult<Output>) -> Void) -> Execution? {
        completion(.success(value))
        return nil
    }
}

public class AsyncOperationSpyReturning<Input, Output, Tag>: TaggedAsyncOperation<Input, Output, Tag> {
    fileprivate let value: Output
    public var inputs = [Input]()

    init(_ value: Output) {
        self.value = value
    }

    override public func execute(
        with input: Input,
        completion: @escaping (OperationResult<Output>) -> Void
    ) -> Execution?  {
        inputs.append(input)
        completion(.success(value))
        return nil
    }
}

extension TaggedAsyncOperation {
    public static func dummy() -> TaggedAsyncOperation<Input, Output, Tag> {
        return AsyncOperationDummy()
    }

    public static func spy() -> AsyncOperationSpy<Input, Output, Tag> {
        return AsyncOperationSpy()
    }

    public static func throwing(_ error: Error = TestError())
        -> TaggedAsyncOperation<Input, Output, Tag> {

        return AsyncOperationThrowing(error)
    }

    public static func returning(_ value: Output) -> TaggedAsyncOperation<Input, Output, Tag> {
        return AsyncOperationReturning(value)
    }

    public static func spyReturning(_ value: Output) -> AsyncOperationSpyReturning<Input, Output, Tag> {
        return AsyncOperationSpyReturning(value)
    }
}
