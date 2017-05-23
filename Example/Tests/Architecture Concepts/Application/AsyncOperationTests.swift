//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import XCTest
import Nimble
import Pyramid

class AsyncOperationTests: XCTestCase {

    func test_GivenNoInputAsyncOperation_ItHasExecuteMethodWithoutInput() {
        let Operation = NoInputAsyncOperation.dummy()
        Operation.execute { _ in }
    }

    func test_Execute_GivenNoInputAsyncOperationCompletingWith42_ItShouldCompleteWith42() {
        let Operation = NoInputAsyncOperation.returning(42)
        var result: Result<Int>?

        Operation.execute { result = $0 }

        expect(result?.value) == 42
    }

    func test_Execute_GivenNoInputAsyncOperationCompletingWithError_ItShouldCompleteWithError() {
        let Operation = NoInputAsyncOperation.throwing()
        var result: Result<Int>?

        Operation.execute { result = $0 }

        expect(result?.error).notTo(beNil())
    }
}

private typealias NoInputAsyncOperation = AsyncOperation<Empty, Int>
