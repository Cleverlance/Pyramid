//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Pyramid

class UserInteractionNotifierFake: UserInteractionNotifier {
    private let _userInteractedWithAppEvent = EventCenterImpl()
    var userInteractedWithAppEvent: Event { return _userInteractedWithAppEvent }

    func fire() { _userInteractedWithAppEvent.fire() }
}
