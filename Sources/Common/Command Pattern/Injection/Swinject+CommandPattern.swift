//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Swinject

extension Container {
    @discardableResult
    public func registerAsync<I, O, AT, T, OperationType: TaggedOperation<I, O, T>>(
        _ asyncType: TaggedAsyncOperation<I, O, AT>.Type,
        with operationType: OperationType.Type
    ) -> ServiceEntry<TaggedAsyncOperation<I, O, AT>>{

        return register(asyncType) {
            CommandAsyncOperation(
                receiver: $0.resolve(operationType)!,
                invoker: $0.resolve(Invoker.self)!
            )
        }
    }
}
