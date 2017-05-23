//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import XCTest
import Nimble
import Pyramid

class ScopeControllerImplTests: XCTestCase {

    func test_ItConformsToScopeController() {
        let _: ScopeController? = (nil as ScopeControllerImpl<ScopeDummy>?)
    }

    func test_ItShouldDependOnParentScopeController() {
        let _ = ScopeControllerImpl<ScopeDummy>(parent: (nil as ScopeController?))
    }

    func test_GetScope_WhenCallingTwiceWithoutDiscard_ItShouldReturnSameInstance() {
        let controller = ScopeControllerImpl<ScopeDummy>(parent: nil)

        let scope1 = controller.getScope() as? ScopeDummy
        let scope2 = controller.getScope() as? ScopeDummy

        expect(scope1).to(beIdenticalTo(scope2))
    }

    func test_GetScope_WhenCallingTwiceWithDiscard_ItShouldReturnDifferentInstance() {
        let controller = ScopeControllerImpl<ScopeDummy>(parent: nil)

        let scope1 = controller.getScope() as? ScopeDummy
        controller.discardScope()
        let scope2 = controller.getScope() as? ScopeDummy

        expect(scope1).notTo(beIdenticalTo(scope2))
    }

    func testScope_ItReturnsScopeInitialisedWithGivenParentScope() {
        let controller = ScopeControllerImpl<ScopeSpy>(
            parent: ScopeControllerStubReturningScopeDummy()
        )

        let scope = controller.getScope() as? ScopeSpy

        expect(scope?.parent as? ScopeDummy).to(beIdenticalTo(ScopeDummy.instance))
    }

    func test_isScopeLoaded_AfterGetScope_ItShouldBeTrue() {
        let controller = ScopeControllerImpl<ScopeDummy>(parent: nil)
        _ = controller.getScope()

        expect (controller.isScopeLoaded) == true
    }

    func test_isScopeLoaded_AfterInit_ItShouldBeFalse() {
        let controller = ScopeControllerImpl<ScopeDummy>(parent: nil)

        expect (controller.isScopeLoaded) == false
    }

    func test_isScopeLoaded_AfterGetScope_AfterDiscardScope_ItShouldBeFalse() {
        let controller = ScopeControllerImpl<ScopeDummy>(parent: nil)
        _ = controller.getScope()
        controller.discardScope()

        expect (controller.isScopeLoaded) == false
    }
}
