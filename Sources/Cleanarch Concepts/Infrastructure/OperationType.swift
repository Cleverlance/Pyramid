//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol OperationType {
    associatedtype Input
    associatedtype Output

    func execute(_ input: Input) throws -> Output
}

public extension OperationType where Input == NoInput {

    public func execute() throws -> Output {
        return try execute(NoInput.instance)
    }
}
