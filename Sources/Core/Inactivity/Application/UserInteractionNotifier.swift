//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol UserInteractionNotifier: AnyObject {
    var userInteractedWithAppEvent: Event { get }
}
