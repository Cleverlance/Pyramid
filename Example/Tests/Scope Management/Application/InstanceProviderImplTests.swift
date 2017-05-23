//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import XCTest
import Nimble
import Pyramid

class InstanceProviderImplTests: XCTestCase {

    func test_ItConformsToInstanceProvider() {
        let _: InstanceProvider<Int>? = (nil as InstanceProviderImpl<Int>?)
    }

    func test_ItDependsOnScopeController() {
        let _ = InstanceProviderImpl<Int>(scopeController: ScopeControllerDummy())
    }

    func test_GetInstance_ItShouldReturnInstanceFromScopeFromGivenController() {
        let provider = InstanceProviderImpl<Int>(
            scopeController: ScopeControllerWithScopeReturning42()
        )
        let result = provider.getInstance()
        expect(result) == 42
    }
}

private class ScopeControllerDummy: ScopeController {
    let isScopeLoaded = false
    func discardScope() {}
    func getScope() -> Scope { return ScopeDummy(parent: nil) }
}

private class ScopeControllerWithScopeReturning42: ScopeController {
    let isScopeLoaded = false
    func discardScope() {}
    func getScope() -> Scope {
        return ScopeReturning42(parent: nil)
    }
}

private class ScopeReturning42: Scope {
    required init(parent: Scope?) {}

    func getInstance<T>(of type: T.Type) -> T? {
        if let result = 42 as? T { return result }
        return nil
    }
}
