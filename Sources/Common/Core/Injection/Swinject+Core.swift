//
//  Copyright © 2016 Cleverlance. All rights reserved.
//
// swiftlint:disable force_cast

import Swinject

extension Container {
    @discardableResult
    public func forward<T, U>(_ type: T.Type, to forwardType: U.Type) -> ServiceEntry<T> {
        return register(type) { $0.resolve(forwardType) as! T }
    }

    public func registerListConverter<ItemConverter: ConverterProtocol>(
        for itemConverterType: ItemConverter.Type
    ) -> ServiceEntry<ListConverter<ItemConverter>> {
        return autoregister(ListConverter<ItemConverter>.self, initializer: ListConverterImpl<ItemConverter>.init)
    }

    public func registerValueWrapperConverters<T: ValueWrapper>(for type: T.Type) where T.Value: Codable {
        autoregister(Converter<WrapperDto<T.Value>, T>.self, initializer: ValueWrapperDomainConverterImpl<T>.init)
        autoregister(Converter<T, WrapperDto<T.Value>>.self, initializer: ValueWrapperExternalConverterImpl<T>.init)
    }
}

public extension Resolver {

    public func ensureSingletonLoaded<T>(type: T.Type) {
        _ = resolve(type)
    }
}
