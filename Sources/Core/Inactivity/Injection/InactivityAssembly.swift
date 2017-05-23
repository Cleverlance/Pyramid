//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Swinject

public var inactivityConfiguration: InactivityConfiguration!

final class InactivityAssembly: Assembly {

    func assemble(container: Container) {

        container.register(InactivityConfiguration.self) { _ in inactivityConfiguration }

        container.register(UserInteractionNotifier.self) { r in
            UserInteractionNotifierImpl(window: r.resolve(UIWindow.self)!)
        }.inObjectScope(.container)

        container.register(AppLifecycleNotifier.self) { _ in AppLifecycleNotifierImpl() }
            .inObjectScope(.container)

        container.register(InactivityNotifier.self) { r in
            InactivityControllerImpl(
                timer: r.resolve(Timer.self)!,
                config: r.resolve(InactivityConfiguration.self)!,
                interactionNotifier: r.resolve(UserInteractionNotifier.self)!,
                lifecycleNotifier: r.resolve(AppLifecycleNotifier.self)!
            )
        }.inObjectScope(.container)
    }

    func loaded(resolver: Resolver) {
        resolver.ensureSingletonLoaded(type: InactivityNotifier.self)
    }
}
