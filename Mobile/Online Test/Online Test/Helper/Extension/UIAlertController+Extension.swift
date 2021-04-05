//
//  UIAlertController+Extension.swift
//  Online Test
//
//  Created by vinova on 4/5/21.
//

import UIKit


extension UIAlertController {
    static var alertController: UIAlertController?
    
    static func alertAcontroller(forError error: APIError) -> UIAlertController {
        return showError(error.message ?? "")
    }
    
    static func alertAcontroller(forError error: Error) -> UIAlertController {
        return showError(error.localizedDescription)
    }
    
    static func showError(_ message: String) -> UIAlertController {
        
        alertController = UIAlertController(
            title: "",
            message: message,
            preferredStyle: .alert
        )
        if let _alertController = alertController {
            _alertController.addAction(
                UIAlertAction(
                    title: "OK",
                    style: .cancel,
                    handler: nil
                )
            )
        }
        return alertController ?? UIAlertController(nibName: "", bundle: nil)
    }
    
    static func hideErrorAlert() {
        if let _alertController = alertController {
            _alertController.dismiss(animated: true, completion: nil)
        }
    }
    
    // Show alert on window
    func showErrorOnWindow() {
        let window = UIApplication.shared.delegate?.window
        DispatchQueue.main.async {
            //hide progress view
            //show alert
            let alertController = self
            //TODO
            //Utils.setColorStatusBar(color: .clear)
            alertController.modalPresentationStyle = .overFullScreen
            window??.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }
}

public extension UIAlertController {
    func show() {
        let win = UIWindow(frame: UIScreen.main.bounds)
        let vc = UIViewController()
        vc.view.backgroundColor = .clear
        win.rootViewController = vc
        win.windowLevel = UIWindow.Level.alert + 1
        win.makeKeyAndVisible()
        vc.present(self, animated: true, completion: nil)
    }
}
