//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

// swiftlint:disable generic_type_name

public protocol ServiceType: OperationType {
    associatedtype Tag
}

open class Service<Input, Output, _Tag>: ServiceType, AbstractClass {
    public typealias Tag = _Tag

    public init () {}

    open func execute(_ input: Input) throws -> Output {
        return markMethodAsVirtual()
    }
}
