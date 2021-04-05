//
//  PopHelper.swift
//  Online Test
//
//  Created by vinova on 4/5/21.
//

import UIKit
import Foundation


class PopupHelper{
    
    static let shared = PopupHelper()
    
    
    func showPopError(popUp:UIViewController, completion: ((_ controller:UIViewController?)->Void)){
        let appDelegate = UIApplication.shared.delegate  as! AppDelegate
        let appWindow = appDelegate.window
        var topViewController = appWindow?.rootViewController

        while topViewController?.presentedViewController != nil{
            topViewController = topViewController?.presentedViewController
        }
        completion(topViewController)
        topViewController?.present(popUp, animated: true, completion: nil)
    }
}
