//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public func check(condition: (Void) -> Bool) throws {
    if !condition() { throw InvalidModelError.instance }
}

public func throwsError<T>(closure: @autoclosure () throws -> T) -> Bool {
    do { try _ = closure(); return false } catch { return true }
}
