//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol ThrowingValueWrapper: Hashable {
    associatedtype Value: Hashable

    var value: Value { get }
    init(_ value: Value) throws
}

extension ThrowingValueWrapper {
    public var hashValue: Int { return value.hashValue }
}

public func == <T: ThrowingValueWrapper>(lhs: T, rhs: T) -> Bool {
    return lhs.value == rhs.value
}

public protocol ValueWrapper: ThrowingValueWrapper {
    init(_ value: Value)
}
