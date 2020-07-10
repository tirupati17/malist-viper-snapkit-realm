//
//  Logger.swift
//  MobileAxxessAssignment
//
//  Created by Tirupati Balan on 10/07/20.
//  Copyright © 2020 Celerstudio. All rights reserved.
//

import Foundation

enum LogType: Int {
    case kNormal = 1
    case kImportant = 2
}

class Logger {
    var isLogEnabled: Bool {
        #if DEBUG
            return true
        #else
            return false
        #endif
    }

    class var sharedLogger : Logger {
        struct defaultSingleton {
            static let loggerInstance = Logger()
        }
        return defaultSingleton.loggerInstance
    }
    
    class func log(_ logString: Any, logType: LogType? = .kNormal) {
        if (Logger.sharedLogger.isLogEnabled == false && logType != .kImportant) {
            return
        } else {
            print(Logger.sharedLogger.isLogEnabled ? "MA: \(logString)" : "")
        }
    }
}
