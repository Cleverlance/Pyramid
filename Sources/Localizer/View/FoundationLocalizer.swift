//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Foundation

public final class FoundationLocalizer: Localizer {

    public init() { }

    public func localize(_ key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
}

private let foundationLocalizer = FoundationLocalizer()
public func localize(_ key: String) -> String {
    return foundationLocalizer.localize(key)
}
