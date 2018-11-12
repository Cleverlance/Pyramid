//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

internal final class AppLifecycleNotifierImpl: AppLifecycleNotifier {

    var didBecomeActiveEvent: Event { return _didBecomeActiveEvent }
    var willResignActiveEvent: Event { return _willResignActiveEvent }
    var didEnterBackgroundEvent: Event { return _didEnterBackgroundEvent }
    var willEnterForegroundEvent: Event { return _willEnterForegroundEvent }
    private let _willEnterForegroundEvent = EventCenterImpl()
    private let _didBecomeActiveEvent = EventCenterImpl()
    private let _willResignActiveEvent = EventCenterImpl()
    private let _didEnterBackgroundEvent = EventCenterImpl()

    init() {
        Foundation.NotificationCenter.default.addObserver(self,
            selector: #selector(AppLifecycleNotifierImpl.appDidBecomeActive),
            name: UIApplication.didBecomeActiveNotification, object: nil)

        Foundation.NotificationCenter.default.addObserver(self,
            selector: #selector(AppLifecycleNotifierImpl.appWillResignActive),
            name: UIApplication.willResignActiveNotification, object: nil)

        Foundation.NotificationCenter.default.addObserver(self,
            selector: #selector(AppLifecycleNotifierImpl.appDidEnterBackground),
            name: UIApplication.didEnterBackgroundNotification, object: nil)

        Foundation.NotificationCenter.default.addObserver(self,
            selector: #selector(AppLifecycleNotifierImpl.appWillEnterForeground),
            name: UIApplication.willEnterForegroundNotification, object: nil)
    }

    @objc private func appDidBecomeActive() {
        _didBecomeActiveEvent.fire()
    }

    @objc private func appWillResignActive() {
        _willResignActiveEvent.fire()
    }

    @objc private func appDidEnterBackground() {
        _didEnterBackgroundEvent.fire()
    }

    @objc private func appWillEnterForeground() {
        _willEnterForegroundEvent.fire()
    }
}
