//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public class ResourceCachingServiceImpl<
    ItemType, StoreResource: StoreResourceType, Resource: ResourceType, Tag
>: Service<NoInput, ItemType, Tag>
where
Resource.Request == NoInput, Resource.Response == ItemType,
StoreResource.Model == ItemType {

    private var loadResource: Resource
    private var storeResource: StoreResource

    public init(
        loadResource: Resource,
        storeResource: StoreResource
    ) {
        self.loadResource = loadResource
        self.storeResource = storeResource
    }

    public override func execute(_: NoInput) throws -> ItemType {
        if let item = (try? storeResource.load()) ?? nil {
            return item
        } else {
            let item = try loadResource.makeRequest()
            try storeResource.save(item)
            return item
        }
    }
}
