//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

internal final class ReachabilityAssembly: Assembly {

    func assemble(container: Container) {

        container.autoregister(ReachabilityController.self,
            initializer: ReachabilityControllerImpl.init
        ).inObjectScope(.container)

        container.register(ReachabilityOperation.self) { _ in
            ReachabilityPlatformOperationImpl()
        }
    }
}
