//
//  Copyright © 2018 Cleverlance. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

final class DeviceStorageAssembly: Assembly {

    func assemble(container: Container) {
        container.autoregister(DeviceStore.self, initializer: DeviceStoreImpl.init)
            .inObjectScope(.container)

        container.autoregister(SecureStore.self, initializer: KeychainStore.init)
            .inObjectScope(.container)
    }
}
