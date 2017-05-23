//
//  Copyright © 2015 Cleverlance. All rights reserved.
//

public class CommandAsyncUsecase<Input, Output, AsyncTag, ReceiverTag>
: AsyncUsecase<Input, Output, AsyncTag> {

    public typealias Receiver = Usecase<Input, Output, ReceiverTag>

    private let receiver: Receiver
    private let invoker: Invoker

    public init(receiver: Receiver, invoker: Invoker) {
        self.receiver = receiver
        self.invoker = invoker
    }

    public override func execute(_ request: Input, completion: @escaping (Result<Output>) -> Void) {
        let command = Command(
            receiver: receiver,
            request: request,
            completion: completion
        )
        invoker.enqueue(command: command)
    }
}
