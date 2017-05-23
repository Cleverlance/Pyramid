//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol InstanceProviderType {
    associatedtype InstanceType
    func getInstance() -> InstanceType
}

public class InstanceProvider<Type>: AbstractClass, InstanceProviderType {

    public init() {}

    public func getInstance() -> Type {
        return markMethodAsVirtual()
    }
}
