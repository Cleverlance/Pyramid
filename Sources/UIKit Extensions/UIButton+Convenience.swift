//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import UIKit

public extension UIButton {

    @IBInspectable public var title: String? {
        set { setTitle(newValue, for: .normal) }
        get { return title(for: .normal) }
    }

    public var titleColor: UIColor? {
        set { setTitleColor(newValue, for: .normal) }
        get { return titleColor(for: .normal) }
    }
}
