//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol NotificationCenter {
    func addObserverForNotification(
        _ name: String,
        block: @escaping () -> Void
    ) -> Observer<String>

    func removeObserver(_ observer: Observer<String>)
}
