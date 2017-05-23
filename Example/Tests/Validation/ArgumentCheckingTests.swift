//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import XCTest
import Nimble
import Pyramid

class ArgumentCheckingTests: XCTestCase {

    func test_check() {
        expect { try check { false } }.to(throwError())
        expect { try check { true } }.notTo(throwError())
    }
}
