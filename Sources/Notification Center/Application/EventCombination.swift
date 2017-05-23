//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public final class CombinedEvent: EventCenterImpl {

    private var observers = [Any]()

    public init(_ events: [Event]) {
        super.init()

        observers = events.map { event in
            event.observe { [unowned self] in self.fire() }
        }
    }
}
