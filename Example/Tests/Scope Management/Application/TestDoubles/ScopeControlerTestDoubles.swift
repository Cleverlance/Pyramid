//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Pyramid
class ScopeControllerStubReturningScopeDummy: ScopeController {
    let isScopeLoaded = false

    func getScope() -> Scope {
        return ScopeDummy.instance
    }

    func discardScope() {}
}
