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

    open func add(_ model: Model) throws { virtualMethod }

    open func loadAll() throws -> [Model] { virtualMethod }

    open func deleteAll() throws { virtualMethod }
}
