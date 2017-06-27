//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol AbstractClass {}

extension AbstractClass {
    var virtualMethod: Never { fatalError() }
}
