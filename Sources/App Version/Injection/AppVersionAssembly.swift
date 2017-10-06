//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Swinject

public final class AppVersionAssembly: Assembly {
    public init() {}
    
    public func assemble(container: Container) {

        container.register(AppVersionGetterOperation.self) { _ in
            AppVersionGetterPlatformOperationImpl()
        }
    }
}
