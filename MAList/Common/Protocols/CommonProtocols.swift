//
//  CommonProtocols.swift
//  MAList
//
//  Created by Tirupati Balan on 12/07/20.
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

protocol LocalizedDescriptionError: Error {
    var localizedDescription: String { get }
}

enum CustomError: LocalizedDescriptionError {
    case invalidArray(model: String)
    case invalidDictionary(model: String)
    case invalidData
    case customError(message: String)
    
    var localizedDescription: String {
        switch self {
            case .invalidArray(model: let model):
                return "\(model) has an invalid array"
            case .invalidDictionary(model: let model):
                return "\(model) has an invalid dictionary"
            case .invalidData:
                return "Invalid data"
            case .customError(message: let message):
                return "\(message)"
        }
    }
}
