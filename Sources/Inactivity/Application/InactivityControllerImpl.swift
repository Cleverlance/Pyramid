//
//  Copyright © 2016 Cleverlance. All rights reserved.
//
// swiftlint:disable date_representation

internal final class InactivityControllerImpl: InactivityNotifier {

    var userHasBeenInactiveEvent: Event { return _userHasBeenInactiveEvent }
    private let _userHasBeenInactiveEvent = EventCenterImpl()

    private let timer: Timer
    private var enterBackgroundDate: Date?

    private var observers = [Any]()

    init(
        timer: Timer,
        config: InactivityConfiguration,
        interactionNotifier: UserInteractionNotifier,
        lifecycleNotifier: AppLifecycleNotifier
    ) {
        self.timer = timer

        resetTimer(to: config.foregroundTimeout)

        onEvent(interactionNotifier.userInteractedWithAppEvent) { [unowned self] in
            self.resetTimer(to: config.foregroundTimeout)
        }

        onEvent(lifecycleNotifier.didBecomeActiveEvent) { [unowned self] in
            self.resetTimer(to: config.foregroundTimeout)
            self.fireIfExceededTimeout(config.backgroundTimeout)
            self.enterBackgroundDate = nil
        }

        onEvent(lifecycleNotifier.didEnterBackgroundEvent) { [unowned self] in
            self.timer.invalidate()
            self.enterBackgroundDate = Date()
        }
    }

    private func resetTimer(to timeout: Double) {
        timer.restart(timeout: timeout, repeat: false) { [unowned self] in
            self._userHasBeenInactiveEvent.fire()
        }
    }

    private func fireIfExceededTimeout(_ timeout: Double) {
        if let date = enterBackgroundDate, Date().timeIntervalSince(date) > timeout {
            _userHasBeenInactiveEvent.fire()
        }
    }

    private func onEvent(_ event: Event, action: @escaping () -> Void) {
        observers.append(event.observe(action))
    }
}
