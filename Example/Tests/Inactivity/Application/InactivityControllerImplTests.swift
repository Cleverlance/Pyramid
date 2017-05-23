//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import XCTest
import Nimble
@testable import Pyramid

class InactivityControllerImplTests: XCTestCase {

    func test_ItConformsToInactivityNotifier() {
        let _: InactivityNotifier? = (nil as InactivityControllerImpl?)
    }

    override func setUp() {
        interactionNotifier = UserInteractionNotifierFake()
        lifecycleNotifier = AppLifecycleNotifierFake()
    }

    func test_init_ItShouldStartTimer() {
        let spy = TimerSpy()

        controller = controllerWith(timer: spy)

        expect(spy.repeats) == [false]
        expect(spy.timeouts) == [fgTimeout]
    }

    func test_WhenTimerFires_ItShouldFireUserHasBeenInactiveEvent() {
        let timer = TimerFake()
        controller = controllerWith(timer: timer)
        var firedCount = 0
        observer = controller.userHasBeenInactiveEvent.observe { firedCount += 1 }

        timer.fire()

        expect(firedCount) == 1
    }

    func test_WhenUserInteracstWithApp_ItShouldResetTimer() {
        let spy = TimerSpy()
        controller = controllerWith(timer: spy)

        interactionNotifier.fire()

        expect(spy.repeats) == [false, false]
        expect(spy.timeouts) == [fgTimeout, fgTimeout]
    }

    func test_WhenAppBecomesActive_ItShouldResetTimerToLongInterval() {
        let spy = TimerSpy()
        controller = controllerWith(timer: spy)

        lifecycleNotifier.fireDidBecomeActive()

        expect(spy.repeats) == [false, false]
        expect(spy.timeouts) == [fgTimeout, fgTimeout]
    }

    func test_WhenAppEntersBackground_ItShouldInvalidateTimer() {
        let spy = TimerSpy()
        controller = controllerWith(timer: spy)

        lifecycleNotifier.fireDidEnterbackground()

        expect(spy.invalidated) == 1
    }

    func test_WhenAppEntersBackgroundAndThenAppBecomesActiveAfterTimeout_ItShouldFireEvent() {
        controller = controllerWith(config: InactivityConfigurationWith(backgroundTimeout: 0))
        var firedCount = 0
        observer = controller.userHasBeenInactiveEvent.observe { firedCount += 1 }

        lifecycleNotifier.fireDidEnterbackground()
        lifecycleNotifier.fireDidBecomeActive()

        expect(firedCount) == 1
    }

    func test_WhenAppEntersBackgroundAndThenAppBecomesActiveBeforeTimeout_ItShouldNotFireEvent() {
        controller = controllerWith(config: InactivityConfigurationWith(backgroundTimeout: 5))
        var firedCount = 0
        observer = controller.userHasBeenInactiveEvent.observe { firedCount += 1 }

        lifecycleNotifier.fireDidEnterbackground()
        lifecycleNotifier.fireDidBecomeActive()

        expect(firedCount) == 0
    }

    func test_WhenAppBecomesActiveWithoutEnteringBackground_ItShouldNotFireInactivityEvent() {
        controller = controllerWith(config: InactivityConfigurationWith(backgroundTimeout: 0))
        var firedCount = 0
        observer = controller.userHasBeenInactiveEvent.observe { firedCount += 1 }

        lifecycleNotifier.fireDidBecomeActive()

        expect(firedCount) == 0
    }

    func test_WhenAppBecomesActiveMultipleTimesAfterEnteringBackground_ItShouldFireOnlyOnce() {
        controller = controllerWith(config: InactivityConfigurationWith(backgroundTimeout: 0))
        var firedCount = 0
        observer = controller.userHasBeenInactiveEvent.observe { firedCount += 1 }

        lifecycleNotifier.fireDidBecomeActive()
        lifecycleNotifier.fireDidEnterbackground()
        lifecycleNotifier.fireDidBecomeActive()
        lifecycleNotifier.fireDidBecomeActive()

        expect(firedCount) == 1
    }
}

private let fgTimeout: Double = 5
private let bgTimeout: Double = 1

private var controller: InactivityControllerImpl!
private var observer: Any?
private var interactionNotifier: UserInteractionNotifierFake!
private var lifecycleNotifier: AppLifecycleNotifierFake!

private func controllerWith(
    timer: Pyramid.Timer = TimerDummy(),
    config: InactivityConfiguration = InactivityConfigurationWith(
        backgroundTimeout: bgTimeout,
        foregroundTimeout: fgTimeout
    )
) -> InactivityControllerImpl {
    return InactivityControllerImpl(
        timer: timer,
        config: config,
        interactionNotifier: interactionNotifier,
        lifecycleNotifier: lifecycleNotifier
    )
}
