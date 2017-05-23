//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import UIKit

public final class EmptyListView: UIView, Loadable {

    var message: String? {
        get { return label.text }
        set { label.text = newValue }
    }

    @IBOutlet weak var label: UILabel! {
        willSet(label) { label.text = nil }
    }
}
