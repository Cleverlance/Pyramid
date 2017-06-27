//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol AppLifecycleNotifier: AnyObject {
    var didBecomeActiveEvent: Event { get }
    var willResignActiveEvent: Event { get }
    var didEnterBackgroundEvent: Event { get }
    var willEnterForegroundEvent: Event { get }
}
