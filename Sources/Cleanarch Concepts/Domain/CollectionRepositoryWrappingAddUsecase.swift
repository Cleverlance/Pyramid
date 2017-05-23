//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

open class CollectionRepositoryWrappingAddUsecase<Repository: CollectionRepositoryType, Tag>:
Usecase<Repository.Model, Void, Tag> {

    private let repository: Repository

    public init(repository: Repository) {
        self.repository = repository
    }

    open override func execute(_ input: Repository.Model) throws -> Void {
        try repository.add(input)
    }
}
