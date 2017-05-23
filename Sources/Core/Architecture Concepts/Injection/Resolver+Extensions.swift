//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Swinject

public extension Resolver {

    public func ensureSingletonLoaded<T>(type: T.Type) {
        _ = resolve(type)
    }
}
