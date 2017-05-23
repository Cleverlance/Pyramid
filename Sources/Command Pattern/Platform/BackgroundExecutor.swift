//
//  Copyright © 2015 Cleverlance. All rights reserved.
//

import Foundation

internal final class BackgroundExecutor: Executor {

    init() { }

    func execute<Command: CommandType>(
        command: Command,
        completion: @escaping (Result<Command.Response>) -> Void
    ) {
        DispatchQueue.global(qos: .default).async {
            do {
                let response = try command.execute()
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }
    }

    func complete<Command: CommandType>(
        command: Command,
        result: Result<Command.Response>
    ) {
        DispatchQueue.main.async {
            command.complete(result)
        }
    }
}
