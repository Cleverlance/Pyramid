//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

// swiftlint:disable generic_type_name

public protocol UsecaseType: OperationType {
    associatedtype Tag
}

open class Usecase<Input, Output, _Tag>: UsecaseType, AbstractClass {
    public typealias Tag = _Tag

    public init() {}

    open func execute(_ input: Input) throws -> Output {
        return markMethodAsVirtual()
    }
}
