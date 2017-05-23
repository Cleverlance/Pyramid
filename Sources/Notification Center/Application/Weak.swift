//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public class Weak<Item: AnyObject> {
    weak var item: Item?

    init (item: Item) {
        self.item = item
    }
}
