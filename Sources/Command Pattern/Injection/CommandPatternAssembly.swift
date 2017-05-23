//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Swinject

final class CommandPatternAssembly: Assembly {

    func assemble(container: Container) {

        container.register(Executor.self) { _ in
            BackgroundExecutor()
        }

        container.register(Invoker.self) { r in
            InvokerImpl(
                executor: r.resolve(Executor.self)!,
                logger: r.resolve(Logger.self)!
            )
        }.inObjectScope(.container)
    }
}
