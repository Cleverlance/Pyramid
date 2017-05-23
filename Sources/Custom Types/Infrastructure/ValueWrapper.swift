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

public extension ValueWrapper {
    public init(_ value: Value) throws {
        self.init(value)
    }
}

public extension ThrowingValueWrapper {

    public init?(valueOrNil: Value?) throws {
        guard let value = valueOrNil else { return nil }
        try self.init(value)
    }
}

public extension ValueWrapper {
    public init?(valueOrNil: Value?) {
        guard let value = valueOrNil else { return nil }
        self.init(value)
    }
}
