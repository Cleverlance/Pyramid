//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

// swiftlint:disable generic_type_name

public protocol AsyncUsecaseType {
    associatedtype Input
    associatedtype Output
    associatedtype Tag

    func execute(_ input: Input, completion: @escaping (Result<Output>) -> Void)
}

open class AsyncUsecase<Input, Output, _Tag>: AsyncUsecaseType, AbstractClass {
    public typealias Tag = _Tag

    public init() {}

    open func execute(_ input: Input, completion: @escaping (Result<Output>) -> Void) {
        return markMethodAsVirtual()
    }
}

public extension AsyncUsecaseType where Input == NoInput {

    public func execute(completion: @escaping (Result<Output>) -> Void) {
        execute(NoInput.instance, completion: completion)
    }
}
