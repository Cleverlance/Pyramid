//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public struct Interval<T> {
    public let min: T?
    public let max: T?

    public init(min: T?, max: T?) {
        self.min = min
        self.max = max
    }
}

public func == <T: Equatable>(lhs: Interval<T>, rhs: Interval<T>) -> Bool {
    return lhs.min == rhs.min && lhs.max == rhs.max
}

public func == <T: Equatable>(lhs: Interval<T>?, rhs: Interval<T>?) -> Bool {
    return lhs?.min == rhs?.min && lhs?.max == rhs?.max
}
