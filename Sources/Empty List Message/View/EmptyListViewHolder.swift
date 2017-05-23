//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import UIKit

public protocol EmptyListViewHolder {
    var emptyListView: EmptyListView { get }
}

extension EmptyListViewHolder where Self: AnyObject {

    public func setEmptyMessage(_ message: String?) {
        emptyListView.message = message
    }
}

public protocol TableViewHolder: UITableViewDataSource, UITableViewDelegate {
    var tableView: UITableView! { get }
}

public extension EmptyListViewHolder where Self: TableViewHolder {

    public func updateEmptyState() {
        if isTableViewEmpty() {
            showEmptyListView()
        } else {
            hideEmptyListView()
        }
    }

    private func isTableViewEmpty() -> Bool {
        for section in 0 ..< (numberOfSections?(in: tableView) ?? 0) {
            if tableView(tableView, numberOfRowsInSection: section) > 0 { return false }
        }
        return true
    }

    private func showEmptyListView() {
        emptyListView.frame = tableView.bounds
        tableView.addSubview(emptyListView)
        tableView.sendSubview(toBack: emptyListView)
    }

    private func hideEmptyListView() {
        emptyListView.removeFromSuperview()
    }
}

extension UITableViewController: TableViewHolder {}
