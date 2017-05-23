//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Swinject

public protocol CompositeAssembly: Assembly {
    var assemblies: [Assembly] { get }
    init()
}

extension CompositeAssembly {
    public func assemble(container: Container) {
        assemblies.forEach { $0.assemble(container: container) }
    }

    public func loaded(resolver: Resolver) {
        assemblies.forEach { $0.loaded(resolver: resolver) }
    }
}
