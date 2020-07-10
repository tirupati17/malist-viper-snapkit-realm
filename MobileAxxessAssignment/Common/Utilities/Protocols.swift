//
//  Protocols.swift
//  MobileAxxessAssignment
//
//  Created by Tirupati Balan on 10/07/20.
//  Copyright © 2020 Celerstudio. All rights reserved.
//

import Foundation
import UIKit

protocol TableViewCellIdentifiable {
    static var cellIdentifier: String { get }
}

extension TableViewCellIdentifiable where Self: UITableViewCell {
    static var cellIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: TableViewCellIdentifiable {}
