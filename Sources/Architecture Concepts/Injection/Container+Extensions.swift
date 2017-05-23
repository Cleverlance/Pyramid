//
//  Copyright © 2016 Cleverlance. All rights reserved.
//
// swiftlint:disable force_cast

import Swinject

extension Container {
    @discardableResult
    public func forward<T, U>(_ type: T.Type, to forwardType: U.Type) -> ServiceEntry<T> {
        return register(type) { $0.resolve(forwardType) as! T }
    }

    @discardableResult
    public func registerAsync<I, O, AT, T>(
        _ asyncType: TaggedAsyncOperation<I, O, AT>.Type,
        with operationType: TaggedOperation<I, O, T>.Type
    ) -> ServiceEntry<TaggedAsyncOperation<I, O, AT>>{

        return register(asyncType) {
            CommandAsyncOperation(
                receiver: $0.resolve(operationType)!,
                invoker: $0.resolve(Invoker.self)!
            )
        }
    }
}
