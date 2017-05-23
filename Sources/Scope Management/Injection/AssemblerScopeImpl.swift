//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Swinject

private protocol AssemblerScope: Scope {
    var assembler: Assembler { get }
}

public class AssemblerScopeImpl<Spec: AssemblerScopeSpec>: AssemblerScope {

    fileprivate let assembler: Assembler

    public required init(parent: Scope?) {
        if let parent = parent as? AssemblerScope {
            assembler = Assembler(parentAssembler: parent.assembler)
        } else {
            assembler = Assembler()
        }
        assembler.apply(assemblies: Spec.assemblies)
    }

    public func getInstance<T>(of type: T.Type) -> T? {
        return assembler.resolver.resolve(type)
    }
}
