//
//  AppDelegate.swift
//  WorkshopTestes
//
//  Created by Michel Anderson Lutz Teixeira on 13/02/19.
//  Copyright © 2019 Michel Lutz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let router = LoginRouter()
        window?.rootViewController = router.makeViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
}

