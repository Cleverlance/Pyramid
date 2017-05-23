//
//  Copyright © 2015 Cleverlance. All rights reserved.
//

public protocol Invoker {
    func enqueue<Command: CommandType>(command: Command)
}

internal final class InvokerImpl: Invoker {

    let executor: Executor
    let logger: Logger

    public init(executor: Executor, logger: Logger) {
        self.executor = executor
        self.logger = logger
    }

    public func enqueue<Command: CommandType>(command: Command) {
        logger.info(String(describing: command))

        executor.execute(command: command) { [unowned self] result in
            switch result {
            case .success(let response):
                self.logger.info(String(describing: response))
                self.executor.complete(command: command, result: result)

            case .failure(let error):
                self.logger.error(error)
                self.executor.complete(command: command, result: result)
            }
        }
    }
}
