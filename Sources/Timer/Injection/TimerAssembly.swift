//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Swinject

public final class TimerAssembly: Assembly {
    public init() {}

    public func assemble(container: Container) {
        container.register(Timer.self) { _ in TimerImpl() }
    }
}
