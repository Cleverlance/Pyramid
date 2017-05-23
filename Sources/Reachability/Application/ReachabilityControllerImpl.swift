//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

internal final class ReachabilityControllerImpl: ReachabilityController {
    private let checkReachability: ReachabilityOperation

    init(checkReachability: ReachabilityOperation) {
        self.checkReachability = checkReachability
    }

    var isReachable: Bool {
        return (try? checkReachability.execute()) ?? false
    }
}
