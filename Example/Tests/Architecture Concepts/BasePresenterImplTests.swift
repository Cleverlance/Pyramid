//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import XCTest
import Nimble
import Pyramid

class BasePresenterImplTests: XCTestCase {

    func test_ItConformsToPresenter() {
        let _: Presenter? = (nil as BasePresenterImpl<View>?)
    }

    func test_active_WhenInitialised_ItShouldBeFalse() {
        let presenter = BasePresenterImpl<View>()
        expect(presenter.isActive).to(beFalse())
    }

    func test_ItShouldNotKeepStrongReferenceOnView() {
        let presenter = BasePresenterImpl<View>()
        presenter.view = ViewDummy()
        expect(presenter.view).to(beNil())
    }

    func test_ItShouldKeepReferenceOnView() {
        let view = ViewDummy()
        let presenter = BasePresenterImpl<View>()
        presenter.view = view

        expect(presenter.view).notTo(beNil())
    }
}

private class ViewDummy: View {}
