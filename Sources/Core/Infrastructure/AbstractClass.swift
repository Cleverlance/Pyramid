//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol AbstractClass {}

extension AbstractClass {
    public var virtualMethod: Never { fatalError() }
}
