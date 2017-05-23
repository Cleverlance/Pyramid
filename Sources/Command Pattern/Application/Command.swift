//
//  Copyright © 2015 Cleverlance. All rights reserved.
//

internal class Command<Request, Response, Tag>: CommandType {

    typealias Receiver = Usecase<Request, Response, Tag>

    private let receiver: Receiver
    let request: Request
    private let completion: (Result<Response>) -> Void

    required init(
        receiver: Receiver,
        request: Request,
        completion: @escaping (Result<Response>) -> Void
    ) {
        self.receiver = receiver
        self.request = request
        self.completion = completion
    }

    func execute() throws -> Response {
        return try receiver.execute(request)
    }

    func complete(_ result: Result<Response>) {
        completion(result)
    }
}
