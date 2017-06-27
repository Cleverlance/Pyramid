//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Swinject

final class TimerAssembly: Assembly {

    func assemble(container: Container) {
        container.register(Timer.self) { _ in TimerImpl() }
    }
}
