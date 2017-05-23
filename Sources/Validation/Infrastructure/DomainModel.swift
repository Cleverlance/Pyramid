//
//  Copyright © 2016 Cleverlance. All rights reserved.
//
// swiftlint:disable force_try

public protocol DomainModel {}

public func assertValid<T: DomainModel>(constructor: (Void) throws -> T) -> T {
    return try! constructor()
}
