//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

public final class LocalStorageAssembly: Assembly {
    public init() {}

    public func assemble(container: Container) {
        container.autoregister(LocalStore.self, initializer: UserDefaultsStoreImpl.init)
            .inObjectScope(.container)
    }
}
