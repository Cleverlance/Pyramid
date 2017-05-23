//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import XCTest
import Nimble
import Pyramid

class ResultCachingOperationImplTests: XCTestCase {

    func test_ItConformsToTestingOperation() {
        let _: TaggedOperation? = (nil as TestingOperationImpl?)
    }

    func test_Execute_WithCachedItem_ItShouldReturnItemFromRepository() {
        let serivce = operationWith(repository: .returning(42))

        let int = try? serivce.execute()

        expect(int) == 42
    }

    func test_Execute_WithoutCachedItem_ItShouldCallLoadResource() {
        let spy = LoadIntOperation.spy()
        let operation = operationWith(loadOperation: spy)

        let _ = try? operation.execute()

        expect(spy.inputs).to(haveCount(1))
    }

    func test_Execute_WithoutCachedItem_ItShouldSaveRemoteResourceLoadedData() {
        let spy = IntRepository.spy()

        let operation = operationWith(repository: spy, loadOperation: .returning(42))

        let _ = try? operation.execute()

        expect(spy.savedModels) == [42]
    }

    func test_GivenThrowingStoreRessourece_ItShouldNotThrow() {
        let serivce = operationWith(repository: .throwing())
        expect(try serivce.execute())
            .notTo(throwError())
    }
}

private func operationWith(
    repository: IntRepository = .dummy(),
    loadOperation: LoadIntOperation = .dummy()
) -> TestingOperationImpl {

    return TestingOperationImpl(
        loadOperation: loadOperation,
        repository: repository
    )
}

private typealias TestingOperationImpl = ResultCachingOperationImpl<Int, IntRepository, LoadIntOperation, Int>
private typealias LoadIntOperation = Pyramid.Operation<Empty, Int>
private typealias IntRepository = Repository<Int>
