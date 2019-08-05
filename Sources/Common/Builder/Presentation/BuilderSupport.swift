//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol BaseBuilder {}

extension BaseBuilder {
    public func any<T, E: Swift.Error>(_ value: T) -> Result<T, E> {
        return .success(value)
    }

    public func notNil<T, E: Swift.Error>(_ value: T?, else error: E) -> Result<T, CompositeError<E>> {
        if let value = value {
            return .success(value)
        } else {
            return .failure(CompositeError(error))
        }
    }
}

extension Result {
    public func pack<OtherValue>(_ other: Result<OtherValue, Failure>, packedError: (Failure, Failure) -> Failure) -> Result<(Success, OtherValue), Failure> {
        switch (self, other) {
        case let (.success(this), .success(other)): return .success((this, other))
        case let (.failure(this), .failure(other)): return .failure(packedError(this, other))
        case let (.success, .failure(error)): return .failure(error)
        case let (.failure(error), .success): return .failure(error)
        }
    }
}

public protocol PackableError: Swift.Error {
    static func pack(_ first: Self, with second: Self) -> Self
}

extension Result where Failure: PackableError {
    public func pack<OtherValue>(_ other: Result<OtherValue, Failure>) -> Result<(Success, OtherValue), Failure> {
        return pack(other, packedError: Failure.pack)
    }
}
