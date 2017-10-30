//
//  Copyright © 2015 Cleverlance. All rights reserved.
//

public class CommandAsyncOperation<Input, Output, AsyncTag, ReceiverTag>
: TaggedAsyncOperation<Input, Output, AsyncTag> {

    public typealias Receiver = TaggedOperation<Input, Output, ReceiverTag>

    private let receiver: Receiver
    private let invoker: Invoker

    public init(receiver: Receiver, invoker: Invoker) {
        self.receiver = receiver
        self.invoker = invoker
    }

    public override func execute(
        with request: Input,
        completion: @escaping (OperationResult<Output>) -> Void
    ) -> Execution? {
        let command = Command(
            receiver: receiver,
            request: request,
            completion: completion
        )
        invoker.enqueue(command: command)
        return nil // FIXME: Make this operation cancellable
    }
}
