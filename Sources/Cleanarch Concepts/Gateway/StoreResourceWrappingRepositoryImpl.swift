//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public class StoreResourceWrappingRepositoryImpl<
    Resource: StoreResourceType
>: Repository<Resource.Model> {

    private let resource: Resource

    public init(resource: Resource) {
        self.resource = resource
        super.init()
    }

    public override func load() throws -> Resource.Model? {
        return try resource.load()
    }

    public override func save(model: Resource.Model) throws {
        try resource.save(model)
    }

    public override func deleteAll() throws {
        try resource.deleteAll()
    }
}
