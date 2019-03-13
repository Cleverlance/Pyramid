//
//  Copyright © 2018 Cleverlance. All rights reserved.
//

open class DeviceRepositoryImpl<Params: DeviceStoreParams, Model, Dto: Codable>: Repository<Model> {

    private let store: DeviceStore
    private let externalConverter: Converter<Model, Dto>
    private let domainConverter: Converter<Dto, Model>

    public init(
        store: DeviceStore,
        externalConverter: Converter<Model, Dto>,
        domainConverter: Converter<Dto, Model>
    ) {
        self.domainConverter = domainConverter
        self.externalConverter = externalConverter
        self.store = store
    }

    open override func save(_ model: Model) throws {
        let dto = try externalConverter.convert(model)
        try store.save(value: PropertyListEncoder().encode(dto), key: Params.key)
    }

    open override func load() throws -> Model? {
        if let data = try store.get(key: Params.key) {
            return try domainConverter.convert(PropertyListDecoder().decode(Dto.self, from: data))
        } else {
            return nil
        }
    }

    open override func deleteAll() throws {
        try store.remove(key: Params.key)
    }
}
