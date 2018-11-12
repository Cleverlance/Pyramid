//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol InactivityNotifier: AnyObject {
    var userHasBeenInactiveEvent: Event { get }
}
