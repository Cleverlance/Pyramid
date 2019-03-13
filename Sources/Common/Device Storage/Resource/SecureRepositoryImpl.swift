//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

open class SecureRepositoryImpl<
    Params: DeviceStoreParams, Model, Dto: Codable
>: DeviceRepositoryImpl<Params, Model, Dto> {

    public init(
        store: SecureStore,
        externalConverter: Converter<Model, Dto>,
        domainConverter: Converter<Dto, Model>
    ) {
        super.init(store: store, externalConverter: externalConverter, domainConverter: domainConverter)
    }
}
