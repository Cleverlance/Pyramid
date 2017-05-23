//
//  Copyright © 2016 Cleverlance. All rights reserved.
//
// swiftlint:disable force_cast

import UIKit

public protocol StoryboardLoadable {
    static var storyboardIdentifier: String { get }
    static var storyboardBundle: Bundle { get }
}

public extension StoryboardLoadable where Self: UIViewController {

    public static var storyboardIdentifier: String { return String(describing: self) }
    public static var storyboardBundle: Bundle {
         return Bundle(for: self)
    }
}

public extension StoryboardLoadable {

    public static func loadFromStoryboard(name: String) -> Self {
        return UIStoryboard(name: name, bundle: storyboardBundle)
            .instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
    }
}
