//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import ObjectMapper

public final class LocalStoreResourceImpl<
    Params: LocalStoreParams, Model, Dto: Mappable
>: StoreResource<Model> {

    private let store: LocalStore
    private let externalConverter: Converter<Model, Dto>
    private let domainConverter: Converter<Dto, Model>

    public init(
        store: LocalStore,
        externalConverter: Converter<Model, Dto>,
        domainConverter: Converter<Dto, Model>
    ) {
        self.domainConverter = domainConverter
        self.externalConverter = externalConverter
        self.store = store
    }

    public override func save(_ model: Model) throws {
        let dto = try externalConverter.convert(model)
        let jsonString = dto.toJSONString()

        try store.save(value: jsonString!, key: Params.key)
    }

    public override func load() throws -> Model? {
        if let jsonString = try store.get(key: Params.key) {
            let dto = Mapper<Dto>().map(JSONString: jsonString)

            return try domainConverter.convert(dto!)
        }

        return nil
    }

    public override func deleteAll() throws {
        try store.remove(key: Params.key)
    }
}
