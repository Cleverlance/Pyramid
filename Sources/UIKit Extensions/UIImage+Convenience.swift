//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import UIKit

public extension UIImage {

    public convenience init?(named name: String, inBundle bundle: Bundle) {
        self.init(named: name, in: bundle, compatibleWith: nil)
    }
}
