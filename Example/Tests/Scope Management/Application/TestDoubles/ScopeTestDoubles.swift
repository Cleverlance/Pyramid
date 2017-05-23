//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Pyramid

class ScopeDummy: Scope {
    static let instance = ScopeDummy(parent: nil)

    required init(parent: Scope?) {}
    func getInstance<T>(of type: T.Type) -> T? { return nil }
}

class ScopeSpy: Scope {

    let parent: Scope?

    required init(parent: Scope?) {
        self.parent = parent
    }

    func getInstance<T>(of type: T.Type) -> T? { return nil }
}
