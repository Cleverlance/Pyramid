//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Swinject

extension Container {
    @discardableResult
    public func registerListConverter<ItemConverter: ConverterProtocol>(
        for itemConverterType: ItemConverter.Type
    ) -> ServiceEntry<ListConverter<ItemConverter>> {
        return autoregister(ListConverter<ItemConverter>.self, initializer: ListConverterImpl<ItemConverter>.init)
    }

    public func registerValueWrapperConverters<T: ValueWrapper>(for type: T.Type) where T.Value: Codable {
        autoregister(Converter<WrapperDto<T.Value>, T>.self, initializer: ValueWrapperDomainConverterImpl<T>.init)
        autoregister(Converter<T, WrapperDto<T.Value>>.self, initializer: ValueWrapperExternalConverterImpl<T>.init)
    }

    @discardableResult
    public func registerEmptyConverter<T>(for modelType: T.Type) -> ServiceEntry<EmptyRequestConverter<T>> {
        return autoregister(EmptyRequestConverter<T>.self, initializer: EmptyRequestConverterImpl<T>.init)
    }
}
