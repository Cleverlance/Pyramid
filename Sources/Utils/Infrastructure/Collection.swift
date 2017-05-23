//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

extension Collection where Iterator.Element : Equatable {

    public func index(of element: Iterator.Element?) -> Index? {
        guard let element = element else { return nil }
        return index(of: element)
    }
}
