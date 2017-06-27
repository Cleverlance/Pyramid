//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol ScopeController: AnyObject {
    var isScopeLoaded: Bool { get }
    func discardScope()
    func getScope() -> Scope
}
