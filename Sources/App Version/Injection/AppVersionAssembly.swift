//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Swinject

final class AppVersionAssembly: Assembly {

    func assemble(container: Container) {

        container.register(AppVersionGetterOperation.self) { _ in
            AppVersionGetterPlatformOperationImpl()
        }
    }
}
