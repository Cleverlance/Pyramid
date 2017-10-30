//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Result

public protocol BaseBuilder {}

public extension BaseBuilder {
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

public extension ResultProtocol {
    public func pack<R: ResultProtocol>(_ other: R, packedError: (Self.Error, Self.Error) -> Self.Error) -> Result<(Self.Value, R.Value), Self.Error> where R.Error == Self.Error {
        return analysis(
            ifSuccess: { first in
                other.analysis(
                    ifSuccess: { .success((first, $0)) },
                    ifFailure: { .failure($0) }
                )
            },
            ifFailure: { first in
                other.analysis(
                    ifSuccess: { _ in .failure(first) },
                    ifFailure: { .failure(packedError(first, $0)) }
                )
            }
        )
    }
}

public protocol PackableError: Swift.Error {
    static func pack(_ first: Self, with second: Self) -> Self
}

public extension ResultProtocol where Error: PackableError {
    public func pack<R: ResultProtocol>(_ other: R) -> Result<(Self.Value, R.Value), Self.Error> where R.Error == Self.Error {
        return pack(other, packedError: Error.pack)
    }
}
