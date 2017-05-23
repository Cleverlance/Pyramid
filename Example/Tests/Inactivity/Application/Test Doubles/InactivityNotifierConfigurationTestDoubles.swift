//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Pyramid

class InactivityConfigurationDummy: InactivityConfiguration {
    let backgroundTimeout: Double = 0
    let foregroundTimeout: Double = 0
}

class InactivityConfigurationWith: InactivityConfiguration {
    let backgroundTimeout: Double
    let foregroundTimeout: Double

    init(backgroundTimeout: Double = 0, foregroundTimeout: Double = 0) {
        self.backgroundTimeout = backgroundTimeout
        self.foregroundTimeout = foregroundTimeout
    }
}
