//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

internal final class LocalStorageAssembly: Assembly {

    func assemble(container: Container) {
        container.autoregister(LocalStore.self, initializer: UserDefaultsStoreImpl.init)
            .inObjectScope(.container)
    }
}
