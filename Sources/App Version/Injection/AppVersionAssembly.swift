//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Swinject

final class AppVersionAssembly: Assembly {

    func assemble(container: Container) {

        container.register(AppVersionGetterUsecase.self) { r in
            ServiceWrappingUsecase(service: r.resolve(AppVersionGetterService.self)!)
        }
        container.register(AppVersionGetterService.self) { _ in
            AppVersionGetterPlatformServiceImpl()
        }
    }
}
