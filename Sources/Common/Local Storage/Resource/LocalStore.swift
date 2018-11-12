//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol LocalStore {
    func get(key: String) throws -> String?
    func save(value: String, key: String) throws
    func remove(key: String) throws
}
