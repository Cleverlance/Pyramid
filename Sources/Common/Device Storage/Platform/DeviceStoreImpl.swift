//
//  Copyright © 2018 Cleverlance. All rights reserved.
//

import Foundation

final class DeviceStoreImpl: DeviceStore {
    private let defaults = UserDefaults(suiteName: "DeviceStore")!

    func get(key: String) throws -> Data? {
        return defaults.data(forKey: key)
    }

    func save(value: Data, key: String) throws {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }

    func remove(key: String) throws {
        defaults.removeObject(forKey: key)
        defaults.synchronize()
    }

    func removeAll() throws {
        defaults.removePersistentDomain(forName: "DeviceStore")
        defaults.synchronize()
    }
}
