//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import ObjectMapper

public struct EmptyDto: Mappable {
    static let instance = EmptyDto()

    fileprivate init() {}

    public init?(map: Map) {}
    public mutating func mapping(map: Map) { }
}
