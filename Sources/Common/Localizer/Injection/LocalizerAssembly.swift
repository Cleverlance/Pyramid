//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Swinject

public final class LocalizerAssembly: Assembly {
    public init() {}
    
    public func assemble(container: Container) {
        container.register(Localizer.self) { _ in FoundationLocalizer() }
            .inObjectScope(.container)
    }
}
