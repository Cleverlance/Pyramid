//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import ReachabilitySwift

internal final class ReachabilityPlatformServiceImpl: ReachabilityService {

    override func execute(_: NoInput) throws -> Bool {
        guard let reachability = Reachability(hostname: "https://google.cz") else {
            throw ReachabilityError.FailedToCreateWithHostname("https://google.cz")
        }
        return reachability.isReachable
    }
}
