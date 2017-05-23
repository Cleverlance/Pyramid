//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol StoreResourceType {
    associatedtype Model

    func load() throws -> Model?
    func save(_ model: Model) throws
    func deleteAll() throws
}

open class StoreResource<Model>: StoreResourceType, AbstractClass {

    public init() { }

    open func load() throws -> Model? {
        return markMethodAsVirtual()
    }

    open func save(_ model: Model) throws {
        return markMethodAsVirtual()
    }

    open func deleteAll() throws {
        return markMethodAsVirtual()
    }
}
