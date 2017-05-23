//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public func ignoreError(closure: (Void) throws -> Void) {
    do { try closure() } catch { }
}
