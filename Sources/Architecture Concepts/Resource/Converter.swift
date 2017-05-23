//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol ConverterType {
    associatedtype Input
    associatedtype Output

    func convert(_ input: Input) throws -> Output
}

open class Converter<Input, Output>: AbstractClass, ConverterType {

    public init() {}

    open func convert(_ input: Input) throws -> Output { virtualMethod }
}

public extension Converter {

    public func convertArray(_ inputs: [Input]?) throws -> [Output] {
        return try (inputs ?? []).map(convert)
    }

    public func convertArrayIgnoreInvalid(_ inputs: [Input]?) -> [Output] {
        if let inputs = inputs {
            return inputs.flatMap { try? convert($0) }
        } else {
            return []
        }
    }
}
