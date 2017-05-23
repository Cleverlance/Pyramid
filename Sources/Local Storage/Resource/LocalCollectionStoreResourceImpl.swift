//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import ObjectMapper

public final class LocalCollectionCollectionStoreResourceImpl<
    Params: LocalStoreParams, Model, Dto: Mappable
>: CollectionStoreResource<Model> {

    private let mapper = Mapper<Dto>()

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

    public override func add(_ model: Model) throws {
        try save(loadAll() + [model])
    }

    public override func loadAll() throws -> [Model] {
        let jsonString = try store.get(key: Params.key)
        let dtos = mapper.mapArray(JSONString: jsonString ?? "")
        return try domainConverter.convertArray(dtos)
    }

    private func save(_ models: [Model]) throws {
        let dtos = try externalConverter.convertArray(models)
        let string = mapper.toJSONString(dtos)
        return try store.save(value: string ?? "", key: Params.key)
    }

    public override func deleteAll() throws {
        try store.remove(key: Params.key)
    }
}
