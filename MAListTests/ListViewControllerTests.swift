//
//  ListViewControllerTests.swift
//  MAListTests
//
//  Created by Tirupati Balan on 13/07/20.
//  Copyright © 2020 Celerstudio. All rights reserved.
//

import Foundation
import XCTest

@testable import MAList

class ListViewControllerTests: XCTestCase {
    
    var listViewController: ListViewController?
    var listWireframe: ListWireframe?
    var listPresenterProtocol: ListPresenterProtocol?

    
    override func setUp() {
        super.setUp()

        listWireframe = ListWireframe()
        listViewController = listWireframe?.viewController as? ListViewController
        listPresenterProtocol = listViewController?.presenter
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Base tests
    
    func testThatListViewControllerExists() {
        XCTAssertNotNil(listViewController, "a listViewController instance should be creatable from storyboard")
    }
    
    func testThatListPresenterProtocolExists() {
        XCTAssertNotNil(listPresenterProtocol, "a listPresenterProtocol instance should be present")
    }

    func testThatAfterViewDidLoadAListWireframeViewControllerIsPresent() {
        XCTAssertNotNil(listWireframe?.viewController, "a ListWireframe viewController instance should be present")
    }

    func testThatAfterViewDidLoadAPresenterIsPresent() {
        XCTAssertNotNil(listViewController?.presenter, "a presenter instance should be present")
    }
            
    func testThatAfterViewDidLoadANoResultViewIsPresent() {
         _ = listViewController?.view
         
         XCTAssertNotNil(listViewController?.noResultView, "a noResultView instance should be present")
    }
    
    // MARK: viewWillAppear tests
    
    func testThatAfterViewWillAppear() {
        _ = listViewController?.view
        
        // TODO
    }
    
    func testThatAfterViewDidDisappear() {
        _ = listViewController?.view
        
        // TODO
    }
    
    func testThatAfterKeyboardWillShow() {
        _ = listViewController?.view
        
        // TODO
    }
    
    func testThatAfterKeyboardWillHide() {
        _ = listViewController?.view
        
        // TODO
    }
    
    func testThatAfterTouchesBegan() {
        _ = listViewController?.view
        
        // TODO
    }
    
    func testThatUpdateTextFieldsUpdatesTextFields() {
        // TODO: Implement
    }
    
    func testThatGoToNextModuleTriggersWireframe() {
        _ = listViewController?.view
        
        // TODO: Implement
    }
}
