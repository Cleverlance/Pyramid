//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol Scope {
    init(parent: Scope?)
    func getInstance<T>(of type: T.Type) -> T?
}
