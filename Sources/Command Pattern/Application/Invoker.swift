//
//  Copyright © 2015 Cleverlance. All rights reserved.
//

public protocol Invoker {
    func enqueue<Command: CommandType>(command: Command)
}

internal final class InvokerImpl: Invoker {

    let executor: Executor

    public init(executor: Executor) {
        self.executor = executor
    }

    public func enqueue<Command: CommandType>(command: Command) {

        executor.execute(command: command) { [unowned self] result in
            switch result {
            case .success:
                self.executor.complete(command: command, result: result)

            case .failure:
                self.executor.complete(command: command, result: result)
            }
        }
    }
}
