//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Swinject

extension Container {
    @discardableResult
    public func registerFactory<I, O, T>(_ type: TaggedFactory<I, O, T>.Type)
    -> ServiceEntry<TaggedFactory<I, O, T>> {

        return register(type) { SwinjectFactory(container: $0 as! Container) }
    }
}

private class SwinjectFactory<Input, Output, Tag>: TaggedFactory<Input, Output, Tag> {
    private unowned var container: Container

    init(container: Container) {
        self.container = container
    }

    override func make(for input: Input) -> Output {
        container.register(Input.self) { _ in input }
        return container.resolve(Output.self)!
    }
}
