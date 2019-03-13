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
}

public extension Resolver {

    public func ensureSingletonLoaded<T>(type: T.Type) {
        _ = resolve(type)
    }
}
