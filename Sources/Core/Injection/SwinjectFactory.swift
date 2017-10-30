//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Swinject

extension Container {
    @discardableResult
    public func registerFactory<I, O, T>(_ type: TaggedFactory<I, O, T>.Type)
    -> ServiceEntry<TaggedFactory<I, O, T>> {

        return register(type) { SwinjectFactory(resolver: $0) }
    }
}

private class SwinjectFactory<Input, Output, Tag>: TaggedFactory<Input, Output, Tag> {
    private let resolver: Resolver

    init(resolver: Resolver) {
        self.resolver = resolver
    }

    override func make(for input: Input) -> Output {
        (resolver as! Container).register(Input.self) { _ in input }
        return resolver.resolve(Output.self)!
    }
}
