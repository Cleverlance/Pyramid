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

    open func format(_ model: Model) -> ViewModel {
        return markMethodAsVirtual()
    }
}

public extension TaggedFormatter {
    public func formatOrNil(_ model: Model?) -> ViewModel? {
        if let model = model {
            return format(model)
        } else {
            return nil
        }
    }
}
