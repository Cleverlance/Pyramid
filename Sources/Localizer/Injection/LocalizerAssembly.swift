//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Swinject

final class LocalizerAssembly: Assembly {

    func assemble(container: Container) {
        container.register(Localizer.self) { _ in FoundationLocalizer() }
            .inObjectScope(.container)
    }
}
