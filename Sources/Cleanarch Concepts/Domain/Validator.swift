//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol ValidatorType {
    associatedtype Input

    func validate(input: Input) -> Bool
}

open class Validator<Input, Model>: AbstractClass, ValidatorType {

    public init() {}

    open func validate(input: Input) -> Bool { virtualMethod }
}
