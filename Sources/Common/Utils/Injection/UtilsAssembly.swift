//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Swinject

public final class UtilsAssembly: Assembly {
    public init() {}

    public func assemble(container: Container) {
        container.autoregister(EmptyExternalConverter.self, initializer: EmptyExternalConverterImpl.init)
        container.autoregister(EmptyDomainConverter.self, initializer: EmptyDomainConverterImpl.init)
    }
}
