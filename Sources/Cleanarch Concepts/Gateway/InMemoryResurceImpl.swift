//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public class InMemoryResourceImpl<Model>: StoreResource<Model> {

    public override init() {}

    private var model: Model?

    public override func load() throws -> Model? {
        return model
    }

    public override func save(_ model: Model) throws {
        self.model = model
    }

    public override func deleteAll() throws {
        model = nil
    }
}
