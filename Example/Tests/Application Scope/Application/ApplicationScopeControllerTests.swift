//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import XCTest
import Pyramid

class ApplicationScopeControllerTests: XCTestCase {

    func testScopeControllerImpl_ItShouldConformToApplicationScopeController() {
        let _: ApplicationScopeController? = (nil as ScopeControllerImpl<ScopeDummy>?)
    }
}
