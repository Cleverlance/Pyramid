//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import KeychainAccess

final class KeychainStore: SecureStore {
    private let keychain = Keychain(service: "SecureStore")

    func get(key: String) throws -> Data? {
        return try keychain.getData(key)
    }

    func save(value: Data, key: String) throws {
        try keychain.set(value, key: key)
    }

    func remove(key: String) throws {
        try keychain.remove(key)
    }

    func removeAll() throws {
        try keychain.removeAll()
    }
}
