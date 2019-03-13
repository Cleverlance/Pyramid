//
//  Copyright © 2018 Cleverlance. All rights reserved.
//

import Swinject

public struct WrapperDto<T: Codable>: Codable {
    let value: T
}

final class ValueWrapperDomainConverterImpl<T: ValueWrapper>: Converter<WrapperDto<T.Value>, T>
where T.Value: Codable {
    override func convert(_ input: WrapperDto<T.Value>) throws -> T {
        return T(input.value)
    }
}

final class ValueWrapperExternalConverterImpl<T: ValueWrapper>: Converter<T, WrapperDto<T.Value>>
where T.Value: Codable {
    override func convert(_ input: T) throws -> WrapperDto<T.Value> {
        return WrapperDto(value: input.value)
    }
}
