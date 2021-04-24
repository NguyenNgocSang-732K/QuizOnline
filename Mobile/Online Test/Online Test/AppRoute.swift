//
//  AppRoute.swift
//  Online Test
//
//  Created by vinova on 3/31/21.
//

import Foundation
import UIKit
import KRProgressHUD

class AppRouter {
    static let shared = AppRouter()
    
//    func updateRootView() {
//        if  UserDefaultHelper.shared.isLoggedIn == true {
//            gotoDashboard()
//        } else {
//            gotoLogin()
//        }
//    }
    
    func gotoLogin() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate, let windowApp = appDelegate.window else { return }
        //---
        let vcLogin = LoginVC()
        windowApp.rootViewController = vcLogin
        windowApp.makeKeyAndVisible()

    }
    
    func gotoHome() {
        KRProgressHUD.show()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate, let windowApp = appDelegate.window else { KRProgressHUD.dismiss(); return }
        //---
        
        Provider.shared.getSubject.getSubject { data in
            
            if let listSubject = data?.data{
                let homeVC = HomeVC(arrSubject: listSubject)
                let navRoot = UINavigationController(rootViewController:homeVC)
            
                windowApp.rootViewController = navRoot
                windowApp.makeKeyAndVisible()
                KRProgressHUD.dismiss()
            }
            else{
                KRProgressHUD.showError(withMessage: "No data")
            }
            
            
            KRProgressHUD.dismiss()
        } failure: { (err) in
            KRProgressHUD.dismiss()
        }


        
        
    }
//
//    func popToBookedScreen(menu: SectionData.Menu) {
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate, let windowApp = appDelegate.window else { return }
//
//        let bookingVC = factory.makeMyBookingVC()
//
//        let dashboard = UINavigationController(rootViewController: bookingVC)
//        let leftMenu = LeftMenuVC()
//        leftMenu.returnVC = menu
//        let sideMenu = AKSideMenu(contentViewController: dashboard, leftMenuViewController: leftMenu, rightMenuViewController: nil)
//        windowApp.rootViewController = sideMenu
//        windowApp.makeKeyAndVisible()
//    }
//
//    func goToEventScreen(menu: SectionData.Menu) {
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate, let windowApp = appDelegate.window else { return }
//        let eventVC = EventViewController(presenter: EventPresenter())
//
//        let dashboard = UINavigationController(rootViewController: eventVC)
//        let leftMenu = LeftMenuVC()
//        leftMenu.returnVC = menu
//        let sideMenu = AKSideMenu(contentViewController: dashboard, leftMenuViewController: leftMenu, rightMenuViewController: nil)
//        windowApp.rootViewController = sideMenu
//        windowApp.makeKeyAndVisible()
//
//    }
//
//    func goToScreen(menu: SectionData.Menu) {
//        var navigation: UIViewController?
//
//        switch menu {
//        case .home:
//            navigation = UINavigationController(rootViewController: HomeVC())
//        case .learning:
//            navigation = UINavigationController(rootViewController: LearningVC())
//        case .event:
//            let presenter = EventPresenter()
//            navigation = UINavigationController(rootViewController: EventViewController(presenter: presenter))
//        case .notes:
//            navigation = UINavigationController(rootViewController: NotesVC())
//        case.bookings:
//            navigation = UINavigationController(rootViewController: factory.makeMyBookingVC())
//        case .bookmark:
//            navigation = UINavigationController(rootViewController: BookmarksVC())
//        case .myPortfolio:
//            navigation = UINavigationController(rootViewController: MyProfileVC())
//        case .appInfo:
//            let presenter = AppInfoPresenter()
//            navigation = UINavigationController(rootViewController: AppInfoViewController(presenter: presenter))
//        default:
//            break
//        }
//
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate,
//              let windowApp = appDelegate.window,
//              let dashboard = navigation else { return }
//
//        let leftMenu = LeftMenuVC()
//        leftMenu.returnVC = menu
//        let sideMenu = AKSideMenu(contentViewController: dashboard, leftMenuViewController: leftMenu, rightMenuViewController: nil)
//        windowApp.rootViewController = sideMenu
//        windowApp.makeKeyAndVisible()
//
//    }
    
}

