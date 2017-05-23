//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public class ResultCachingOperationImpl<
    ItemType, Repository: RepositoryProtocol, Operation: OperationProtocol, Tag
>: TaggedOperation<Empty, ItemType, Tag>
where
Operation.Input == Empty, Operation.Output == ItemType,
Repository.Model == ItemType {

    private var loadOperation: Operation
    private var repository: Repository

    public init(
        loadOperation: Operation,
        repository: Repository
    ) {
        self.loadOperation = loadOperation
        self.repository = repository
    }

    public override func execute(with _: Empty) throws -> ItemType {
        if let item = (try? repository.load()) ?? nil {
            return item
        } else {
            let item = try loadOperation.execute()
            ignoreError { try repository.save(item) }
            return item
        }
    }
}
