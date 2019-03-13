//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public struct EmptyDto: Codable {}

public typealias EmptyExternalConverter = Converter<Empty, EmptyDto>
public typealias EmptyDomainConverter = Converter<EmptyDto, Void>
public typealias EmptyRequestConverter<Model> = Converter<Model, EmptyDto>

final class EmptyExternalConverterImpl: EmptyExternalConverter {

    override func convert(_ input: Empty) throws -> EmptyDto {
        return EmptyDto()
    }
}

final class EmptyDomainConverterImpl: EmptyDomainConverter {

    override func convert(_ input: EmptyDto) throws {}
}

public final class EmptyRequestConverterImpl<Model>: EmptyRequestConverter<Model> {

    public override func convert(_ input: Model) throws -> EmptyDto {
        return EmptyDto()
    }
}

