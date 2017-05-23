//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

open class Repository<Model>: AbstractClass {

    public init() {}

    open func load() throws -> Model? {
        return markMethodAsVirtual()
    }

    open func save(model: Model) throws {
        return markMethodAsVirtual()
    }

    open func deleteAll() throws {
        return markMethodAsVirtual()
    }
}
