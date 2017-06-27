//
//  Copyright © 2015 Cleverlance. All rights reserved.
//

internal class Command<Request, Response, Tag>: CommandType {

    typealias Receiver = TaggedOperation<Request, Response, Tag>

    private let receiver: Receiver
    let request: Request
    private let completion: (OperationResult<Response>) -> Void

    required init(
        receiver: Receiver,
        request: Request,
        completion: @escaping (OperationResult<Response>) -> Void
    ) {
        self.receiver = receiver
        self.request = request
        self.completion = completion
    }

    func execute() throws -> Response {
        return try receiver.execute(with: request)
    }

    func complete(_ result: OperationResult<Response>) {
        completion(result)
    }
}
