//
//  Copyright © 2016 Cleverlance. All rights reserved.
//
// swiftlint:disable force_cast

import Swinject

extension Container {
    // FIXME: Is there a way to require `U: T` ?
    @discardableResult
    public func forward<T, U>(_ type: T.Type, to forwardType: U.Type) -> ServiceEntry<T> {
        return register(type) { r in r.resolve(forwardType) as! T }
    }
}
