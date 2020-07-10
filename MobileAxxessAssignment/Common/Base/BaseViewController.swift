//
//  BaseViewController.swift
//  MobileAxxessAssignment
//
//  Created by Tirupati Balan on 10/07/20.
//  Copyright © 2020 Celerstudio. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

open class BaseViewController: UIViewController {
    
    var didSetupConstraints = false
    
    var activityIndicator: UIActivityIndicatorView?
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        return refreshControl
    }()
 
    deinit {
        Logger.log("Deinit \(type(of: self))")
    }
    
}

// MARK: life cycle

extension BaseViewController {
    
    /**
      This method is called after the view controller has loaded its view hierarchy into memory.
      This method is called regardless of whether the view hierarchy was loaded from a nib file or created programmatically in the loadView() method. You usually override this method to perform additional initialization on views that were loaded from nib files.
     */
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDefaultActivityIndicator()
        Logger.log("viewDidLoad \(type(of: self))")
        
    }
    
    /**
        This method is called before the view controller's view is about to be added to a view hierarchy and before any animations are configured for showing the view. You can override this method to perform custom tasks associated with displaying the view. For example, you might use this method to change the orientation or style of the status bar to coordinate with the orientation or style of the view being presented. If you override this method, you must call super at some point in your implementation.
        For more information about the how views are added to view hierarchies by a view controller, and the sequence of messages that occur, see Supporting Accessibility.
        Note
        If a view controller is presented by a view controller inside of a popover, this method is not invoked on the presenting view controller after the presented controller is dismissed.
     */
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    open override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

// MARK: public

extension BaseViewController {

    /**
     Pops the top view controller from the navigation stack .
     */
    @objc public func popViewController() {
        _ = navigationController?.popViewController(animated: true)
    }
    
}

// MARK: refresh control

extension BaseViewController {
    
    func setupRefreshControl(_ scrollView: UITableView) {
        refreshControl.addTarget(self, action: #selector(BaseViewController.triggerRefreshControl), for: .valueChanged)
        scrollView.addSubview(refreshControl)
    }
    
    @objc func triggerRefreshControl() {
        refreshControl.beginRefreshing()
        refreshControl.endRefreshing()
        handleRefreshContent()
    }
    
    @objc func handleRefreshContent() {}

}

// MARK: setup navigation

extension BaseViewController {
    
    func prefersLargeTitles() {
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
    }

    func setupNavigationBackButton() {

    }
}

// MARK: setup activity inidicator

extension BaseViewController {
    
    func setupDefaultActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator?.center = view.center
        
        view.addSubview(activityIndicator!)
    }
    
    func showIndicator() {
        if let activityIndicator = self.activityIndicator {
            activityIndicator.startAnimating()
        }
    }
    
    func hideIndicator() {
        if let activityIndicator = self.activityIndicator {
            activityIndicator.stopAnimating()
        }
    }
    
}
