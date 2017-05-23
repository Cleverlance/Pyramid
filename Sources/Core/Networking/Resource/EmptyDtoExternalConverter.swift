//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public typealias EmptyRequestExternalConverter<Request> = Converter<Request, EmptyDto>

public class EmptyRequestExternalConverterImpl<Request>: EmptyRequestExternalConverter<Request> {
    public override init() {}

    public override func convert(_ input: Request) throws -> EmptyDto {
        return EmptyDto.instance
    }
}
