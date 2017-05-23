//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

internal final class ReachabilityControllerImpl: ReachabilityController {
    private let checkReachability: ReachabilityUsecase

    init(checkReachability: ReachabilityUsecase) {
        self.checkReachability = checkReachability
    }

    var isReachable: Bool {
        return (try? checkReachability.execute()) ?? false
    }
}
