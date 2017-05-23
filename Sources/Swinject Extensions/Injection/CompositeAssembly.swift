//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Swinject

open class CompositeAssembly: Assembly {

    private let assemblies: [Assembly]

    public init(assemblies: [Assembly]) {
        self.assemblies = assemblies
    }

    public func assemble(container: Container) {
        assemblies.forEach { $0.assemble(container: container) }
    }

    public func loaded(resolver: Resolver) {
        assemblies.forEach { $0.loaded(resolver: resolver) }
    }
}
