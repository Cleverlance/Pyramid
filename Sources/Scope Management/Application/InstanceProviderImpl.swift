//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public class InstanceProviderImpl<Type>: InstanceProvider<Type> {

    private let scopeController: ScopeController

    public init(scopeController: ScopeController) {
        self.scopeController = scopeController
    }

    public override func getInstance() -> Type {
        let scope = scopeController.getScope()
        return scope.getInstance(of: Type.self)!
    }
}
