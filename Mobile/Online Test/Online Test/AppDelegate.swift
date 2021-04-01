//
//  AppDelegate.swift
//  Online Test
//
//  Created by vinova on 3/29/21.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window : UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let loginVC = LoginVC()

        window?.rootViewController = loginVC
        window?.makeKeyAndVisible()
        
        
        IQKeyboardManager.shared.enable = true
        // Override point for customization after application launch.
        return true
    }

 



}

