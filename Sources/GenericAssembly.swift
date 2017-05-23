//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Swinject

public final class GenericAssembly: CompositeAssembly {
    public var assemblies: [Assembly] = [
        LocalizerAssembly(),
        CommandPatternAssembly(),
        TimerAssembly(),
        InactivityAssembly(),
        LocalStorageAssembly(),
        AppVersionAssembly()
    ]

    public init() {}
}
