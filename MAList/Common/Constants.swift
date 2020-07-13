//
//  Constants.swift
//  MAList
//
//  Created by Tirupati Balan on 10/07/20.
//  Copyright © 2020 Celerstudio. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    static let appBundleName = "MAList"
    
    enum Images: String {
        case backIcon = "back"
        func image() -> UIImage? {
            return UIImage(named: self.rawValue)
        }
    }
    
    enum DateFormatter {
        case response
        case display
        
        func formatter() -> Foundation.DateFormatter {
            switch self {
            case .response:
                return utcFormatter(string: "MM/dd/yyyy")
            case .display:
                let localFormatter = Foundation.DateFormatter()
                localFormatter.dateStyle = .full
                return localFormatter
            }
        }
        
        private func utcFormatter(string: String) -> Foundation.DateFormatter {
            let localFormatter = Foundation.DateFormatter()
            localFormatter.dateFormat = string
            if Locale.preferredLanguages.count > 0 {
                localFormatter.locale = Locale(identifier: Locale.preferredLanguages[0])
            }
            localFormatter.timeZone = TimeZone(identifier: "UTC")
            return localFormatter
        }
        
        func stringFromDate(_ date: Date) -> String {
            return self.formatter().string(from: date)
        }
        
        func dateFromString(_ string: String) -> Date? {
            return self.formatter().date(from: string)
        }
                
    }

}
