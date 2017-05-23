//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public protocol Event {
    func observe(_ block: @escaping (Void) -> Void) -> Observer<String>
    func removeObserver(_ observer: Observer<String>)
}
