//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol DummyCreatable {
    static var dummy: Self { get }
}

extension Int: DummyCreatable {
    public static let dummy = 0
}
