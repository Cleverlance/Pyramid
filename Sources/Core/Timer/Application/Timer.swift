//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol Timer {
    func invalidate()
    func restart(timeout: Double, repeat: Bool, fire: @escaping () -> Void)
}
