//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public struct CompositeError<Error: Swift.Error>: Swift.Error {
    public let parts: [Error]

    public init(_ parts: [Error]) {
        self.parts = parts
    }

    public init(_ part: Error) {
        self.parts = [part]
    }
}

extension CompositeError: PackableError {
    public static func pack(_ first: CompositeError<Error>, with second: CompositeError<Error>) -> CompositeError<Error> {
        return CompositeError(first.parts + second.parts)
    }
}
