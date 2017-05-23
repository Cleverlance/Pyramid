//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol AbstractClass { }

public extension AbstractClass {

    public func markMethodAsVirtual<T>(methodName: String = #function) -> T {
        fatalError("\(methodName) called on abstract class \(type(of: self))")
    }
}
