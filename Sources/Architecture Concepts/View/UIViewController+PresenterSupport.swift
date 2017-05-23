//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import UIKit

public extension UIViewController {

    func customViewWillAppear(animated: Bool) {
        self.customViewWillAppear(animated: animated)

        if let holder = self as? AnyPresenterHolder, let presenter = holder.anyPresenter {
            presenter.active = true
        }
    }

    func customViewDidDisappear(animated: Bool) {
        self.customViewDidDisappear(animated: animated)

        if let holder = self as? AnyPresenterHolder, let presenter = holder.anyPresenter {
            presenter.active = false
        }
    }
}

// MARK: - Swizzling

public extension UIViewController {
    open override class func initialize() {
        guard self === UIViewController.self else { return }
        doSwizzling(self)
    }
}

private let doSwizzling: (UIViewController.Type) -> Void = { viewController in
    swizzle(
        originalSelector: #selector(UIViewController.viewWillAppear(_:)),
        swizzledSelector: #selector(UIViewController.customViewWillAppear(animated:)),
        onClass: viewController
    )

    swizzle(
        originalSelector: #selector(UIViewController.viewDidDisappear(_:)),
        swizzledSelector: #selector(UIViewController.customViewDidDisappear(animated:)),
        onClass: viewController
    )
}

private func swizzle(
    originalSelector: Selector,
    swizzledSelector: Selector,
    onClass clazz: AnyClass
) {
    let originalMethod = class_getInstanceMethod(clazz, originalSelector)
    let swizzledMethod = class_getInstanceMethod(clazz, swizzledSelector)

    let didAddMethod = class_addMethod(clazz, originalSelector,
        method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))

    if didAddMethod {
        class_replaceMethod(clazz, swizzledSelector, method_getImplementation(originalMethod),
            method_getTypeEncoding(originalMethod))
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
}
