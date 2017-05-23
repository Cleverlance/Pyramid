//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Pyramid

class AppLifecycleNotifierFake: AppLifecycleNotifier {
    var didBecomeActiveEvent: Event { return _didBecomeActiveEvent }
    private let _didBecomeActiveEvent = EventCenterImpl()
    var willResignActiveEvent: Event { return _willResignActiveEvent }
    private let _willResignActiveEvent = EventCenterImpl()
    var didEnterBackgroundEvent: Event { return _didEnterBackgroundEvent }
    private let _didEnterBackgroundEvent = EventCenterImpl()
    var willEnterForegroundEvent: Event { return _willEnterForegroundEvent }
    private let _willEnterForegroundEvent = EventCenterImpl()

    func fireDidBecomeActive() { _didBecomeActiveEvent.fire() }
    func fireWillResignActiveEvent() { _willResignActiveEvent.fire() }
    func fireWillEnterForeground() { _willEnterForegroundEvent.fire() }
    func fireDidEnterbackground() { _didEnterBackgroundEvent.fire() }
}
