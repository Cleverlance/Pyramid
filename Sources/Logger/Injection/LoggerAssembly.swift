//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Swinject

final internal class LoggerAssembly: Assembly {

    func assemble(container: Container) {

        container.register(Logger.self) { _ in
            ConsoleLogger()
        }
    }
}
