//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public class ScopeControllerImpl<ScopeType: Scope>: ScopeController {

    private let parent: ScopeController?
    private var scope: Scope?

    public var isScopeLoaded: Bool { return scope != nil }

    public init(parent: ScopeController?) {
        self.parent = parent
    }

    public func getScope() -> Scope {
        if let scope = scope { return scope }

        let newScope = ScopeType(parent: parent?.getScope())
        scope = newScope
        return newScope
    }

    public func discardScope() {
        scope = nil
    }
}
