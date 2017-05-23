//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public class ResourceWrappingService<Resource: ResourceType, Tag>: Service<
    Resource.Request, Resource.Response, Tag
> {
    private let resource: Resource

    public init(resource: Resource) {
        self.resource = resource
    }

    public override func execute(_ input: Resource.Request) throws -> Resource.Response {
        return try resource.makeRequest(input)
    }
}
