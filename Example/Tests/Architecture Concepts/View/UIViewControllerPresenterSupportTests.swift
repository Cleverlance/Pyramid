// swiftlint:disable function_body_length

import Quick
import Nimble
import Pyramid

class UIViewControllerPresenterSupportTests: QuickSpec {
    override func spec() {

        describe("view controller with single presenter") {
            var spy: PresenterSpy!
            var viewController: ViewControllerWithPresenter!

            beforeEach {
                spy = PresenterSpy()
                viewController = ViewControllerWithPresenter(spy)
            }

            it("should activate presenter on viewWillAppear") {
                viewController.viewWillAppear(true)
                expect(spy.isActiveChanges) == [true]
            }

            it("should deactivate presenter on viewDidDisappear") {
                viewController.viewDidDisappear(true)
                expect(spy.isActiveChanges) == [false]
            }
        }

        describe("view controller with multiple presenters") {
            var spy1: PresenterSpy!
            var spy2: PresenterSpy!
            var viewController: ViewControllerWithPresenters!

            beforeEach {
                spy1 = PresenterSpy()
                spy2 = PresenterSpy()
                viewController = ViewControllerWithPresenters([spy1, spy2])
            }

            it("should activate presenters on viewWillAppear") {
                viewController.viewWillAppear(false)
                expect(spy1.isActiveChanges) == [true]
                expect(spy2.isActiveChanges) == [true]
            }

            it("should deactivate presenters on viewDidDisappear") {
                viewController.viewDidDisappear(false)
                expect(spy1.isActiveChanges) == [false]
                expect(spy2.isActiveChanges) == [false]
            }
        }
    }
}

private class PresenterSpy: Presenter {
    var isActiveChanges = [Bool]()
    var isActive = false {
        didSet { isActiveChanges.append(isActive) }
    }
}

private class ViewControllerWithPresenter: UIViewController, PresenterHolder {
    let presenter: Presenter

    init(_ presenter: Presenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

private class ViewControllerWithPresenters: UIViewController, MultiplePresenterHolder {
    let presenters: [Presenter]

    init(_ presenters: [Presenter]) {
        self.presenters = presenters
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
