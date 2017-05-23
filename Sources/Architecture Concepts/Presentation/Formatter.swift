//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol FormatterType {
    associatedtype Model
    associatedtype ViewModel

    func format(_ model: Model) -> ViewModel
}

public typealias Formatter<Model, ViewModel> = TaggedFormatter<Model, ViewModel, Void>
open class TaggedFormatter<Model, ViewModel, Tag>: AbstractClass, FormatterType {
    public init() {}

    open func format(_ model: Model) -> ViewModel { virtualMethod }
}
