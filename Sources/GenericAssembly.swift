//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Swinject

public final class GenericAssembly: CompositeAssembly {

    public init() {
        super.init(
            assemblies: [
                LocalizerAssembly(),
                CommandPatternAssembly(),
                LoggerAssembly(),
                NetworkingAssembly(),
                TimerAssembly(),
                InactivityAssembly(),
                LocalStorageAssembly(),
                ReachabilityAssembly(),
                AppVersionAssembly()
            ]
        )
    }
}
