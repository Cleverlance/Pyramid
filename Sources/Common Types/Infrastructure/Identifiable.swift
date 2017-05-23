//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public struct Identifier<Model>: ValueWrapper {
    public let value: String

    public init(_ value: String) { self.value = value }
}

public protocol Identifiable {}

extension Identifiable {
    public typealias Id = Identifier<Self>
}
