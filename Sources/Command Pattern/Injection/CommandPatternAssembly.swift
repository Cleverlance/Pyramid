//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Swinject

public final class CommandPatternAssembly: Assembly {
    public init() {}
    
    public func assemble(container: Container) {

        container.register(Executor.self) { _ in
            BackgroundExecutor()
        }

        container.register(Invoker.self) { r in
            InvokerImpl(executor: r.resolve(Executor.self)!)
        }.inObjectScope(.container)
    }
}
