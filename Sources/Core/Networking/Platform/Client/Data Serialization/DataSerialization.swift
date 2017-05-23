//
//  Copyright © 2015 Cleverlance. All rights reserved.
//

import Foundation

internal enum DataSerializationError: Error {
    case serializationError
}

internal protocol DataSerialization {
    func deserializeData(_ data: Data) throws -> Any
}
