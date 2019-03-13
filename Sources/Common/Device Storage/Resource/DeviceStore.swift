//
//  Copyright © 2018 Cleverlance. All rights reserved.
//

public protocol ResetableStore {
    func removeAll() throws
}

public protocol DeviceStore: ResetableStore {
    func get(key: String) throws -> Data?
    func save(value: Data, key: String) throws
    func remove(key: String) throws
}

public protocol DeviceStoreParams {
    static var key: String { get }
}
