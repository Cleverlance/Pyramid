//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

@testable import Pyramid

class RemoteResourceConfigDummy: RemoteResourceConfig {
    func baseUrl() -> String { return "" }
}

class RemoteResourceConfigReturning: RemoteResourceConfig {
    let value: String
    init(_ value: String) { self.value = value }

    func baseUrl() -> String { return value }
}
