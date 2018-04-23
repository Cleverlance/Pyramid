//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol MultiplePresenterHolder: AnyObject {
    var presenters: [Presenter] { get }
}

public protocol PresenterHolder: MultiplePresenterHolder {
    associatedtype PresenterType
    var presenter: PresenterType { get }
}

public extension PresenterHolder {
    var presenters: [Presenter] { return [presenter].compactMap { $0 as? Presenter } }
}
