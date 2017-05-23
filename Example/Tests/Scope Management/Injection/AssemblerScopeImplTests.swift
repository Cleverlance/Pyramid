//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import XCTest
import Nimble
import Pyramid
import Swinject

class AssemblerScopeImplTests: XCTestCase {

    func test_ItConformsToScopeProtocol() {
        let _: Scope? = (nil as AssemblerScopeImpl<SpecDummy>?)
    }

    func testGetInstanceOf_GivenSpecWithInt42Assembly_WhenRequestingInt_ItShouldReturn42() {
        let scope = AssemblerScopeImpl<SpecStubWithInt42Assembly>(parent: nil)
        let result = scope.getInstance(of: Int.self)
        expect(result) == 42
    }

    func test_GetInstanceOf_GivenParentWithSpecWithInt42_WhenRequestingInt_itShouldReturn42() {
        let scope = AssemblerScopeImpl<SpecDummy>(parent: ScopeStubInt42(parent: nil))
        let result = scope.getInstance(of: Int.self)
        expect(result) == 42
    }
}

private struct SpecDummy: AssemblerScopeSpec {
    static var assemblies = [Assembly]()
}

private struct SpecStubWithInt42Assembly: AssemblerScopeSpec {
    static var assemblies: [Assembly] = [AssemblyStubInt42()]
}

private struct AssemblyStubInt42: Assembly {

    func assemble(container: Container) {
        container.register(Int.self) { _ in 42 }
    }
}

private typealias ScopeStubInt42 = AssemblerScopeImpl<SpecStubWithInt42Assembly>
