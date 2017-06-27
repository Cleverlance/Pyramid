//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public class Observer<Notification: Hashable> {

    let notification: Notification
    let block: (Void) -> Void

    internal init(notificationName: Notification, block: @escaping (Void) -> Void ) {
        self.notification = notificationName
        self.block = block
    }
}
