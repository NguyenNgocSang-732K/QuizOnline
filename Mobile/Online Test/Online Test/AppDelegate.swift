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
        let homeVC = HomeVC()
        let navBaseVC = UINavigationController(rootViewController: homeVC)
        window?.rootViewController = navBaseVC
        window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle



}

