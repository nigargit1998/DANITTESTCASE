//
//  TableViewCell+extension.swift
//  DONITTESTCASE
//
//  Created by Nigar Mammadova on 29.10.22.
//

import UIKit

extension UITableViewCell {
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
    static var identifier: String {
        return String(describing: self)
    }
}
