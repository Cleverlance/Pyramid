//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol FormatterProtocol {
    associatedtype Model
    associatedtype ViewModel

    func format(_ model: Model) -> ViewModel
}

public typealias Formatter<Model, ViewModel> = TaggedFormatter<Model, ViewModel, Void>

open class TaggedFormatter<Model, ViewModel, Tag>: AbstractClass, FormatterProtocol {
    public init() {}

    public func format(_ model: Model) -> ViewModel { virtualMethod }
}
