//
//  AppDelegate.swift
//  CZDatePicker
//
//  Created by guaker on 07/13/2023.
//  Copyright (c) 2023 guaker. All rights reserved.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
#if DEBUG
        print(NSHomeDirectory())
#endif
        
        self.window?.rootViewController = TableViewController()

        self.window?.backgroundColor = .white
        self.window?.makeKeyAndVisible()
        
        return true
    }

}
