//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

internal final class UserDefaultsStoreImpl: LocalStore {

    func get(key: String) throws -> String? {
        return UserDefaults.standard.string(forKey: key)
    }

    func remove(key: String) throws {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }

    func save(value: String, key: String) throws {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
}
