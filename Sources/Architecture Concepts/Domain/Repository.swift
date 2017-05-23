//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol RepositoryProtocol {
    associatedtype Model

    func load() throws -> Model?
    func save(_ model: Model) throws
    func deleteAll() throws
}

open class Repository<Model>: AbstractClass {

    public init() {}

    open func load() throws -> Model? { virtualMethod }
    open func save(_ model: Model) throws { virtualMethod }
    open func deleteAll() throws { virtualMethod}
}
