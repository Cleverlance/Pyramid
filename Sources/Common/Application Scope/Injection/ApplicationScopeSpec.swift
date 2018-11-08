//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Swinject

public struct ApplicationScopeSpec: ConfigurableAssemblerScopeSpec {
    public static var configurableAssemblies = [Assembly]()

    public static var internalAssemblies: [Assembly] = [
        ApplicationScopeControllerAssembly()
    ]
}

private class ApplicationScopeControllerAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ApplicationScopeController.self) { _ in sharedApplicationScopeController }
    }
}
