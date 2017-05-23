//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

class RepositoryDummy<Model>: Repository<Model> {
    override func deleteAll() throws {}
    override func load() throws -> Model? { return nil }
    override func save(_ model: Model) throws {}
}

public class RepositorySpy<Model>: Repository<Model> {
    public enum Operation { case load, deleteAll, save }

    public var savedModels = [Model]()
    public var loadCalled = 0
    public var deleteAllCalled = 0
    public var operations = [Operation]()

    override public func deleteAll() throws {
        deleteAllCalled += 1
        operations.append(.deleteAll)
    }

    override public func load() throws -> Model? {
        loadCalled += 1
        operations.append(.load)
        return nil
    }

    override public func save(_ model: Model) throws {
        savedModels.append(model)
    }
}

class RepositoryThrowing<Model>: Repository<Model> {
    fileprivate let error: Error

    init(_ error: Error = TestError()) {
        self.error = error
    }

    override func deleteAll() throws { throw error }
    override func load() throws -> Model? { throw error }
    override func save(_ model: Model) throws { throw error }
}

class RepositoryReturning<Model>: Repository<Model> {
    fileprivate let model: Model?

    init(_ model: Model?) {
        self.model = model
    }

    override func deleteAll() throws {}
    override func load() throws -> Model? { return model }
    override func save(_ model: Model) throws {}
}

public class RepositoryFake<Model>: Repository<Model> {
    public var model: Model?

    override public func deleteAll() throws {
        model = nil
    }

    override public func load() throws -> Model? {
        return model
    }

    override public func save(_ model: Model) throws {
        self.model = model
    }
}

extension Repository {

    public static func dummy() -> Repository<Model> {
        return RepositoryDummy()
    }

    public static func spy() -> RepositorySpy<Model> {
        return RepositorySpy()
    }

    public static func throwing(_ error: Error = TestError()) -> Repository<Model> {
        return RepositoryThrowing(error)
    }

    public static func returning(_ model: Model?) -> Repository<Model> {
        return RepositoryReturning(model)
    }

    public static func fake() -> RepositoryFake<Model> {
        return RepositoryFake()
    }
}
