//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public class CollectionStoreResourceWrappingRepositoryImpl<
    Resource: CollectionStoreResourceType
>: CollectionRepository<Resource.Model> {

    private let resource: Resource

    public init(resource: Resource) {
        self.resource = resource
    }

    public override func deleteAll() throws {
        try resource.deleteAll()
    }

    public override func add(_ model: Resource.Model) throws {
        try resource.add(model)
    }

    public override func loadAll() throws -> [Resource.Model] {
        return try resource.loadAll()
    }
}
