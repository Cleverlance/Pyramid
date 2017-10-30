//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public let sharedApplicationScopeController: ApplicationScopeController = {
    return ScopeControllerImpl<ApplicationScope>(parent: nil)
}()
