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

        container.register(ReachabilityUsecase.self) { r in
            ServiceWrappingUsecase(service: r.resolve(ReachabilityService.self)!)
        }
        container.register(ReachabilityService.self) { _ in
            ReachabilityPlatformServiceImpl()
        }
    }
}
