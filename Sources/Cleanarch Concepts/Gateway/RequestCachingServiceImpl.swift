//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public class RequestCachingServiceImpl<
    Resource: ResourceType, Tag
>: Service<Resource.Request, Resource.Response, Tag>
where Resource.Request: Equatable {

    private var cachedInput: Resource.Request?
    private var cachedOutput: Resource.Response?

    private let resource: Resource

    public init(resource: Resource) {
        self.resource = resource
    }

    public override func execute(_ input: Resource.Request) throws -> Resource.Response {
        if let cachedOutput = cachedOutput, cachedInput == input {
            return cachedOutput
        } else {
            let output = try resource.makeRequest(input)
            cachedInput = input
            cachedOutput = output
            return output
        }
    }
}
