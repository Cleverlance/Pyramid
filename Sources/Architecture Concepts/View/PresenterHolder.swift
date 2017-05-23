//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol AnyPresenterHolder: AnyObject {
    var anyPresenter: Presenter? { get }
}

public protocol PresenterHolder: AnyPresenterHolder {
    associatedtype PresenterType
    var presenter: PresenterType { get }
}

public extension PresenterHolder {
    var anyPresenter: Presenter? { return presenter as? Presenter }
}
