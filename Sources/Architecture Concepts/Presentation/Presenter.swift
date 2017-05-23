//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol View: AnyObject {}

public protocol Presenter: AnyObject {
    var isActive: Bool { get set }
}

open class BasePresenterImpl<ViewType>: Presenter {

    private var hasBeenActiveBefore = false

    public var isActive = false {
        didSet {
            if isActive {
                if !hasBeenActiveBefore { didBecomeActiveFirstTime() }
                didBecomeActive()
                hasBeenActiveBefore = true
            } else {
                didBecomeInactive()
            }
        }
    }

    private weak var _view: AnyObject?
    public var view: ViewType? {
        get { return _view as? ViewType }
        set { _view = newValue as AnyObject? }
    }

    public init() {}

    open func didBecomeActive() {}
    open func didBecomeActiveFirstTime() {}
    open func didBecomeInactive() {}
}
