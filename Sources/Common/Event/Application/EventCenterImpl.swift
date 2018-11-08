//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public class EventCenterImpl: BaseNotificationCenterImpl<String>, Event, FireableEvent {

    public override init() {}

    public func observe(_ block: @escaping () -> Void) -> Observer<String> {
        return registerObserverForNotification("", block: block)
    }

    public func removeObserver(_ observer: Observer<String>) {
        removeRegisteredObserverFromObserversArray(observer)
    }

    public func fire() {
        postNotificationRegisteredWithName("")
    }
}
