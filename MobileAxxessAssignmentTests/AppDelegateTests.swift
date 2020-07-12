//
//  AppDelegateTests.swift
//  MobileAxxessAssignmentTests
//
//  Created by Tirupati Balan on 12/07/20.
//  Copyright © 2020 Celerstudio. All rights reserved.
//

import Foundation
import XCTest
import UIKit

@testable import MobileAxxessAssignment

class AppDelegateTests: XCTestCase {
    
    var appDelegate: AppDelegate = AppDelegate()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test after init
    
    
    // MARK: Test after application launch
    
    func testWindowIsKeyAfterApplicationLaunch() {
       if let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
            XCTAssertTrue(window.isKeyWindow)
       } else {
            XCTFail("app delegate window should not be nil")
       }
    }
    
    func testThatDidFinishLaunchingWithOptionsReturnsTrue() {
        XCTAssertTrue(appDelegate.application(UIApplication.shared, didFinishLaunchingWithOptions: nil), "should return true from didFinishLaunchingWithOptions")
    }
}
