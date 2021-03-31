//
//  AppDelegate.swift
//  Online Test
//
//  Created by vinova on 3/29/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window : UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let loginVC = LoginVC()

        window?.rootViewController = loginVC
        window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }

 



}

