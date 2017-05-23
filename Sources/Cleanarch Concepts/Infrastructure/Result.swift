//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}
