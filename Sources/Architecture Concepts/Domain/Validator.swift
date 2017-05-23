//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol ValidatorProtocol {
    associatedtype Input

    func isValid(_ input: Input) -> Bool
}

open class Validator<Input, Model>: AbstractClass, ValidatorProtocol {
    public init() {}

    open func isValid(_ input: Input) -> Bool { virtualMethod }
}

public func check(condition: (Void) -> Bool) throws {
    if !condition() { throw InvalidModelError() }
}

public struct InvalidModelError: Error {}
