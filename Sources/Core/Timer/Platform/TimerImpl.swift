//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

final class TimerImpl: Timer {

    private var timer: Foundation.Timer?
    private var fire: (() -> Void)?

    init() {}

    func invalidate() {
        timer?.invalidate()
    }

    func restart(timeout: Double, repeat repeats: Bool, fire: @escaping () -> Void) {
        invalidate()
        self.fire = fire

        timer = Foundation.Timer.scheduledTimer(timeInterval: timeout,
            target: self,
            selector: #selector(TimerImpl.timerFired),
            userInfo: nil,
            repeats: repeats
        )
    }

    @objc private func timerFired() {
        fire?()
    }
}
