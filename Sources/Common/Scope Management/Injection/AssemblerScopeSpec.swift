//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Swinject

public protocol AssemblerScopeSpec {
    static var assemblies: [Assembly] { get }
}

public protocol ConfigurableAssemblerScopeSpec: AssemblerScopeSpec {
    static var configurableAssemblies: [Assembly] { get set }
    static var internalAssemblies: [Assembly] { get set }
}

extension ConfigurableAssemblerScopeSpec {
    public static var assemblies: [Assembly] {
        return internalAssemblies + configurableAssemblies
    }

    public static var internalAssemblies: [Assembly] { return [] }
}
