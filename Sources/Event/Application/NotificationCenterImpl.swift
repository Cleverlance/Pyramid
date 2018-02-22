//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public class NotificationCenterImpl: BaseNotificationCenterImpl<String>, NotificationCenter,
PostableNotificationCenter {

    public func addObserverForNotification(
        _ name: String,
        block: @escaping () -> Void
    ) -> Observer<String> {
        return registerObserverForNotification(name, block: block)
    }

    public func postNotification(name: String) {
        postNotificationRegisteredWithName(name)
    }

    public func removeObserver(_ observer: Observer<String>) {
        removeRegisteredObserverFromObserversArray(observer)
    }
}
