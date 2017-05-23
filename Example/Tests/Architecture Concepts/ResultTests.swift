//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import XCTest
import Nimble
import Pyramid

class ResultTests: XCTestCase {

    func test_response_givenSuccess42_itShouldEquals42() {
        let result = Result.success(42)
        expect(result.value).to(equal(42))
    }

    func test_response_givenFailure_itShouldBeNil() {
        let result = Result<Int>.failure(TestError())
        expect(result.value).to(beNil())
    }

    func test_error_givenSuccess_itShouldBeNil() {
        let result = Result.success(42)
        expect(result.error).to(beNil())
    }

    func test_error_givenFailureWithTestError_itShouldBeTestError() {
        let result = Result<Int>.failure(TestError())
        expect(result.error).notTo(beNil())
    }
}
