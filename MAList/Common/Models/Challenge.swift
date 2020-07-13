//
//  Challenge.swift
//  MAList
//
//  Created by Tirupati Balan on 10/07/20.
//  Copyright © 2020 Celerstudio. All rights reserved.
//

import Foundation
import RealmSwift

// MARK: - Challenge
class Challenge: Object, Codable {
    @objc dynamic var id: String?
    @objc dynamic var type: String?
    @objc dynamic var date: String?
    @objc dynamic var data: String?

    enum CodingKeys: String, CodingKey {
        case id, type, date, data
    }
}

extension Challenge: ListViewItemProtocol {
    var dateString: String {
        if let date = self.date, let dateObject = Constants.DateFormatter.response.dateFromString(date) {
            return Constants.DateFormatter.display.stringFromDate(dateObject)
        } else {
            return ""
        }
    }
    
    var dataString: String {
        return self.data ?? ""
    }
    
    var dataType: DataType {
        if let type = self.type {
            switch type {
            case "text":
                return DataType.text
            default:
                return DataType.image
            }
        }
        return DataType.text
    }
        
    var idString: String {
        return self.id ?? ""
    }
        
}

