//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Foundation

internal final class StringDataSerialization: DataSerialization {

    let logger: Logger

    init(logger: Logger) {
        self.logger = logger
    }

    func deserializeData(_ data: Data) throws -> Any {
        guard let body = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else {
            logger.error("Error while converting Unicode string.")
            throw DataSerializationError.serializationError
        }

        logger.info("Serialized: \(body)")
        return body
    }
}
