//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

internal final class JSONDataSerialization: DataSerialization {

    let logger: Logger

    init(logger: Logger) {
        self.logger = logger
    }

    func deserializeData(_ data: Data) throws -> Any {
        var body: Any!
        do {
            body = try JSONSerialization.jsonObject(
                with: data,
                options: JSONSerialization.ReadingOptions()
            )
        } catch {
            logger.error(error)
            throw DataSerializationError.serializationError
        }

        return body
    }
}
