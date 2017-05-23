//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

class AsyncOperationDummy<Input, Output, Tag>: TaggedAsyncOperation<Input, Output, Tag> {
    override func execute(with input: Input, completion: @escaping (Result<Output>) -> Void) { }
}

public class AsyncOperationSpy<Input, Output, Tag>: TaggedAsyncOperation<Input, Output, Tag> {
    public var inputs = [Input]()

    override public func execute(with input: Input, completion: @escaping (Result<Output>) -> Void) {
        inputs.append(input)
    }
}

class AsyncOperationThrowing<Input, Output, Tag>: TaggedAsyncOperation<Input, Output, Tag> {
    fileprivate let error: Error

    init(_ error: Error) {
        self.error = error
    }

    override func execute(with input: Input, completion: @escaping (Result<Output>) -> Void) {
        completion(.failure(error))
    }
}

class AsyncOperationReturning<Input, Output, Tag>: TaggedAsyncOperation<Input, Output, Tag> {
    fileprivate let value: Output

    init(_ value: Output) {
        self.value = value
    }

    override func execute(with input: Input, completion: @escaping (Result<Output>) -> Void) {
        completion(.success(value))
    }
}

public class AsyncOperationSpyReturning<Input, Output, Tag>: TaggedAsyncOperation<Input, Output, Tag> {
    fileprivate let value: Output
    public var inputs = [Input]()

    init(_ value: Output) {
        self.value = value
    }

    override public func execute(with input: Input, completion: @escaping (Result<Output>) -> Void) {
        inputs.append(input)
        completion(.success(value))
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
