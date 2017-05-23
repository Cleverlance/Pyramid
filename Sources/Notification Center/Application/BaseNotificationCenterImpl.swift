//
//  Copyright © 2016 Cleverlance. All rights reserved.
//
// swiftlint:disable identifier_name

public class BaseNotificationCenterImpl<Notification: Hashable> {

    private var observers = [Weak<Observer<Notification>>]()

    internal func registerObserverForNotification(
        _ name: Notification,
        block: @escaping (Void) -> Void
    ) -> Observer<Notification> {

        let observer = Observer(notificationName: name, block: block)
        observers.append(Weak(item: observer))

        return observer
    }

    internal func removeRegisteredObserverFromObserversArray(_ observer: Observer<Notification>) {
        observers = observers.filter { o in o.item !== observer }
    }

    internal func postNotificationRegisteredWithName(_ name: Notification) {
        cleanDisposedObservers()
        sendNotificationsToObserversListenedForRegisteredName(name: name)
    }

    internal func cleanDisposedObservers() {
        observers = observers.filter { o in o.item != nil }
    }

    private func sendNotificationsToObserversListenedForRegisteredName(name: Notification) {
        for o in observers {
            if let item = o.item, item.notification == name {
                item.block()
            }
        }
    }
}
