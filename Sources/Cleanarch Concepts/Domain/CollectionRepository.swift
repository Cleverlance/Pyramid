//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol CollectionRepositoryType {
    associatedtype Model

    func add(_ model: Model) throws
    func loadAll() throws -> [Model]
    func deleteAll() throws
}

open class CollectionRepository<Model>: AbstractClass, CollectionRepositoryType {

    public init() {}

    open func add(_ model: Model) throws {
        return markMethodAsVirtual()
    }

    open func loadAll() throws -> [Model] {
        return markMethodAsVirtual()
    }

    open func deleteAll() throws {
        return markMethodAsVirtual()
    }
}
