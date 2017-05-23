//
//  Copyright © 2015 Cleverlance. All rights reserved.
//
// swiftlint:disable force_cast
// swiftlint:disable opening_brace
// swiftlint:disable colon

import UIKit

public protocol Loadable {
    static var nib: UINib { get }
}

public protocol Reusable {
    static var reuseIdentifier: String { get }
}

public extension Loadable where Self: AnyObject {
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

public extension Reusable {
    static var reuseIdentifier: String { return String(describing: self) }
}

public protocol LoadableCell: Reusable, Loadable {}

// MARK: - Usage

public extension Loadable where Self: UIView {
    static func loadFromNib() -> Self {
        return nib.instantiate(withOwner: nil, options: nil).first as! Self
    }
}

public extension UITableView {
    func registerCell<U>(_ cellType: U.Type) where U: Reusable, U: Loadable, U: UITableViewCell {
        register(U.nib, forCellReuseIdentifier: U.reuseIdentifier)
    }

    func registerCellClass<U>(_ cellType: U.Type) where U: Reusable, U: UITableViewCell {
        register(U.self, forCellReuseIdentifier: U.reuseIdentifier)
    }

    func registerHeaderFooterViewClass<U>(_ viewType: U.Type)
    where U: Reusable, U: UITableViewHeaderFooterView {

        register(U.self, forHeaderFooterViewReuseIdentifier: U.reuseIdentifier)
    }

    func registerHeaderFooterView<U>(_ viewType: U.Type)
    where U: Loadable, U: Reusable, U: UITableViewHeaderFooterView {

        register(U.nib, forHeaderFooterViewReuseIdentifier: U.reuseIdentifier)
    }

    func dequeueReusableCell<U>(_ cellType: U.Type, for indexPath: IndexPath) -> U
    where U: Reusable, U: UITableViewCell {

        return dequeueReusableCell(withIdentifier: U.reuseIdentifier, for: indexPath) as! U
    }

    func dequeueReusableCell<U>(_ cellType: U.Type) -> U? where U: Reusable, U: UITableViewCell {
        return dequeueReusableCell(withIdentifier: U.reuseIdentifier) as? U
    }

    func dequeueReusableHeaderFooterView<U>(viewType: U.Type) -> U?
    where U: Reusable, U: UITableViewHeaderFooterView {

        return dequeueReusableHeaderFooterView(withIdentifier: U.reuseIdentifier) as? U
    }
}

public extension UICollectionView {
    func registerCell<U>(_ cellType: U.Type)
    where U: Reusable, U: Loadable, U: UICollectionViewCell {
        register(U.nib, forCellWithReuseIdentifier: U.reuseIdentifier)
    }

    func dequeueReusableCell<U>(_ cellType: U.Type, for indexPath: IndexPath) -> U
    where U: Reusable, U: UICollectionViewCell
    {
        return dequeueReusableCell(withReuseIdentifier: U.reuseIdentifier, for: indexPath) as! U
    }

    func registerSupplementaryView<U>(_ viewType: U.Type, ofKind kind: String)
    where U: Reusable, U: Loadable, U: UICollectionReusableView {

        register(U.nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: U.reuseIdentifier)
    }

    func dequeueReusableSupplementaryView<U>(
        _ viewType: U.Type,
        ofKind kind: String,
        for indexPath: IndexPath
    ) -> U where U: Reusable, U: UICollectionReusableView {

        return dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: U.reuseIdentifier,
            for: indexPath
        ) as! U
    }
}
