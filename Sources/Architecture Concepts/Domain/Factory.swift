//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol FactoryProtocol {
    associatedtype Input
    associatedtype Output

    func make(for input: Input) -> Output
}

public typealias Factory<Input, Output> = TaggedFactory<Input, Output, Void>

open class TaggedFactory<Input, Output, Tag>: AbstractClass, FactoryProtocol {
    public init() {}

    open func make(for input: Input) -> Output { virtualMethod }
}
