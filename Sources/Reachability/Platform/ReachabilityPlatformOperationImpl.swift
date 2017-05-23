//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import ReachabilitySwift

internal final class ReachabilityPlatformOperationImpl: ReachabilityOperation {

    override func execute(with _: Empty) throws -> Bool {
        guard let reachability = Reachability(hostname: "https://google.cz") else {
            throw ReachabilityError.FailedToCreateWithHostname("https://google.cz")
        }
        return reachability.isReachable
    }
}
