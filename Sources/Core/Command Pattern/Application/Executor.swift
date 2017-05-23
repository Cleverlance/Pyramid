//
//  Copyright © 2015 Cleverlance. All rights reserved.
//

internal protocol Executor {
    func execute<Command: CommandType>(
        command: Command,
        completion: @escaping (Result<Command.Response>) -> Void
    )
    func complete<Command: CommandType>(command: Command, result: Result<Command.Response>)
}
