//
//  Section.swift
//  ExtendedTableViewController
//
//  Created by Austin-Michael Komatz on 12/5/18.
//  Copyright © 2018 Austin-Michael Komatz. All rights reserved.
//

import UIKit

/// A section in a table view, expressed as a structure.
///
/// The rows in a section are stored as the `AnyRow` type. Because normal Row objects are generic,
/// they cannot be simply stored in a normal array. Therefore, they are kept in the `AnyRow` "box"
/// until they are used. At this point, they must be casted to the specified type.
public struct Section {
    
    /// The rows in the section.
    var rows: [AnyRow] = []
    
    var headerTitle: String? = nil
    var estimatedHeaderHeight: CGFloat = UITableView.automaticDimension
    var headerHeight: CGFloat = UITableView.automaticDimension
    var headerView: UIView? = nil
    
    var footerTitle: String? = nil
    var estimatedFooterHeight: CGFloat = UITableView.automaticDimension
    var footerHeight: CGFloat = UITableView.automaticDimension
    var footerView: UIView? = nil
    
    /// The number of rows in the section.
    var rowCount: Int { return rows.count }
    
    /// Appends a row to the end of the section.
    ///
    /// - Parameter newRow: The row to be appended to the section.
    public mutating func appendRow<T: Row>(_ newRow: T) {
        rows.append(newRow)
    }
    
    /// Inserts a row into the section at the specified index.
    ///
    /// - Parameters:
    ///   - newRow: The row to be added to the section.
    ///   - index: The index to insert the row into.
    public mutating func insertRow(_ newRow: AnyRow, at index: Int) {
        rows.insert(newRow, at: index)
    }
    
    /// Inserts a row into the section at the specified index.
    ///
    /// - Parameters:
    ///   - newRow: The row to be added to the section.
    ///   - index: The index to insert the row into.
    public mutating func insertRow<T: Row>(_ newRow: T, at index: Int) {
        rows.insert(AnyRow(newRow), at: index)
    }
    
    /// Removes the row at the specified index.
    ///
    /// - Parameter index: The index of the row to be removed.
    public mutating func removeRow(at index: Int) {
        rows.remove(at: index)
    }
    
    /// Returns a configured table view cell for the table view at the specified index path.
    public func cellForRow(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        return rows[indexPath.row].configuredCell(for: tableView, at: indexPath)!
    }
    
    /// Removes the header from the section.
    public mutating func removeHeader() {
        headerTitle = nil
        headerView = UIView()
        headerHeight = CGFloat.leastNonzeroMagnitude
    }
    
    /// Removes the footer from the section.
    public mutating func removeFooter() {
        footerTitle = nil
        footerView = UIView()
        footerHeight = CGFloat.leastNonzeroMagnitude
    }
    
}