//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public typealias EmptyDtoDomainConverter = Converter<EmptyDto, Void>

internal class EmptyDtoDomainConverterImpl: EmptyDtoDomainConverter {
    override init() {}
    override func convert(_ input: EmptyDto) throws -> Void {}
}
