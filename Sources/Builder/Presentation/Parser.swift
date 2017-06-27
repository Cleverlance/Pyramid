//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol ParserProtocol {
    associatedtype ViewModel
    associatedtype Model

    func parse(_ input: ViewModel) -> Model?
}

public typealias Parser<ViewModel, Model> = TaggedParser<ViewModel, Model, Void>

open class TaggedParser<ViewModel, Model, Tag>: AbstractClass, ParserProtocol {
    public init() {}

    open func parse(_ input: ViewModel) -> Model? { virtualMethod }
}

extension ParserProtocol {
    public func parse(_ input: ViewModel?) -> Parsed<Model> {
        guard let input = input else { return .missing }
        guard let model = parse(input) else { return .invalid }
        return .value(model)
    }
}

public enum Parsed<Model> {
    case missing
    case invalid
    case value(Model)
}

extension Parsed {
    var value: Model? {
        switch self {
        case .value(let value): return value
        case .missing, .invalid: return nil
        }
    }
}
