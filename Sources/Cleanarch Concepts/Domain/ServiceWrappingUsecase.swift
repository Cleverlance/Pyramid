//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

open class ServiceWrappingUsecase<Service: ServiceType, Tag>:
Usecase<Service.Input, Service.Output, Tag> {

    private let service: Service

    public init(service: Service) {
        self.service = service
    }

    open override func execute(_ input: Service.Input) throws -> Service.Output {
        return try service.execute(input)
    }
}
