//
//  LoginVC.swift
//  Online Test
//
//  Created by vinova on 3/31/21.
//

import UIKit
import LocalAuthentication

class LoginVC: UIViewController {

    @IBOutlet weak var viewUsername: UIView!
    
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var tfUsername: UITextField!
    
    
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupUI()

        // Do any additional setup after loading the view.
    }


    
    func setupUI(){
        
        viewUsername.layer.cornerRadius = 20
        viewUsername.clipsToBounds = true
        viewPassword.clipsToBounds = true
        viewPassword.layer.cornerRadius = 20
        btnLogin.layer.cornerRadius = 15
        btnLogin.clipsToBounds = true
        
    }
    
    @IBAction func clickLogin(_ sender: Any) {
        
        AppRouter.shared.gotoHome()
        
        
    }
     
    @IBAction func clickTouchID(_ sender: Any) {
        
        let context = LAContext()
            var error: NSError?

            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Identify yourself!"

                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                    [weak self] success, authenticationError in

                    DispatchQueue.main.async {
                        if success {
                            AppRouter.shared.gotoHome()
                        } else {
                            let ac = UIAlertController(title: "Authentication failed", message: "You could not be verified; please try again.", preferredStyle: .alert)
                            ac.addAction(UIAlertAction(title: "OK", style: .default))
                            self?.present(ac, animated: true)
                        }
                    }
                }
            } else {
                // no biometry
            }
        
    }
    
    @IBAction func clickRegister(_ sender: Any) {
    }
}
