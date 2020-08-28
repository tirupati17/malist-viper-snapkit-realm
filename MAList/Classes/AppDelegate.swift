//
//  AppDelegate.swift
//  MAList
//
//  Created by Tirupati Balan on 10/07/20.
//  Copyright © 2020 Celerstudio. All rights reserved.
//

import UIKit
import RealmSwift
import UserExperior

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Realm.Configuration.defaultConfiguration.deleteRealmIfMigrationNeeded = true

        let initialController = UINavigationController()
        initialController.setRootWireframe(ListWireframe())

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = initialController
        self.window?.makeKeyAndVisible()
        
        UserExperior.initialize("76338b1c-c45c-48a9-bfcb-9603d01756a4")
        
        return true
    }

}

extension AppDelegate {
        
}
