//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public func ignoreError(closure: () throws -> Void) {
    do { try closure() } catch { }
}
