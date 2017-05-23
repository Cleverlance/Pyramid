//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Generic

class TimerDummy: Timer {
    func invalidate() {}
    func restart(timeout: Double, repeat: Bool, fire: @escaping () -> Void) {}
}

class TimerSpy: Timer {
    var invalidated = 0
    var timeouts = [Double]()
    var repeats = [Bool]()

    func invalidate() { invalidated += 1 }
    func restart(timeout: Double, repeat rep: Bool, fire: @escaping () -> Void) {
        timeouts.append(timeout)
        repeats.append(rep)
    }
}

class TimerFake: Timer {
    var fire: (() -> Void) = {}

    func invalidate() {}
    func restart(timeout: Double, repeat: Bool, fire: @escaping () -> Void) {
        self.fire = fire
    }
}
