//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

open class BasePresenterImpl<ViewType>: Presenter {

    private var hasBeenActiveBefore = false

    public var active = false {
        didSet {
            if active {
                if !hasBeenActiveBefore { didBecomeActiveFirstTime() }
                didBecomeActive()
                hasBeenActiveBefore = true
            } else {
                didbecomeInactive()
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
    open func didbecomeInactive() {}
}
