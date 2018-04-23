//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import UIKit

extension UIViewController {

    @objc public func customViewWillAppear(_ animated: Bool) {
        self.customViewWillAppear(animated)

        if let holder = self as? MultiplePresenterHolder {
            holder.presenters.forEach { $0.isActive = true }
        }
    }

    @objc public func customViewDidDisappear(_ animated: Bool) {
        self.customViewDidDisappear(animated)

        if let holder = self as? MultiplePresenterHolder {
            holder.presenters.forEach { $0.isActive = false }
        }
    }
}
