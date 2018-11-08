//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol ConverterProtocol {
    associatedtype Input
    associatedtype Output

    func convert(_ input: Input) throws -> Output
}

public typealias Converter<Input, Output> = TaggedConverter<Input, Output, Void>

open class TaggedConverter<Input, Output, Tag>: AbstractClass, ConverterProtocol {
    public init() {}

    open func convert(_ input: Input) throws -> Output { virtualMethod }
}

extension ConverterProtocol {

    public func convertArray(_ inputs: [Input]?) throws -> [Output] {
        return try (inputs ?? []).map(convert)
    }

    public func convertArrayIgnoreInvalid(_ inputs: [Input]?) -> [Output] {
        if let inputs = inputs {
            return inputs.compactMap { try? convert($0) }
        } else {
            return []
        }
    }
}
