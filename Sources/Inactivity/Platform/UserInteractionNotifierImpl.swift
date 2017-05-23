//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

internal final class UserInteractionNotifierImpl: NSObject, UserInteractionNotifier,
UIGestureRecognizerDelegate {

    var userInteractedWithAppEvent: Event { return _userInteractedWithAppEvent }
    private let _userInteractedWithAppEvent = EventCenterImpl()

    private let recognizer = UIGestureRecognizer(target: nil, action: nil)
    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
        super.init()

        recognizer.delegate = self
        window.addGestureRecognizer(recognizer)
    }

    deinit {
        window.removeGestureRecognizer(recognizer)
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch)
    -> Bool {
        _userInteractedWithAppEvent.fire()
        return false
    }
}
