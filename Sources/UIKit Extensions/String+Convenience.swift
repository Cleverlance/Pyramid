//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

extension String {
    public var nilIfEmpty: String? {
        return self.isEmpty ? nil : self
    }
}
