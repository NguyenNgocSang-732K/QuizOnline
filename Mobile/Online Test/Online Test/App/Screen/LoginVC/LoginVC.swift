//
//  LoginVC.swift
//  Online Test
//
//  Created by vinova on 3/31/21.
//

import UIKit
import LocalAuthentication

class LoginVC: BaseViewControllers {

    @IBOutlet weak var viewUsername: UIView!
    
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var tfUsername: UITextField!
    
    @IBOutlet weak var btnTrackID: UIButton!
    
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    
    @IBOutlet weak var spaceBottom: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupUI()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification ,
                                                  object: nil)
    }
    
    
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardRectValue = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardRectValue.height
            UIView.animate(withDuration: 0.4) {
                self.spaceBottom.constant = keyboardHeight
                self.view.layoutIfNeeded()
            }
        }
    }
    @objc func keyboardWillHide(_ notification: Notification) {
       
        UIView.animate(withDuration: 0.4) {
            self.spaceBottom.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    


    
    func setupUI(){
        
        viewUsername.layer.cornerRadius = 20
        viewUsername.clipsToBounds = true
        viewPassword.clipsToBounds = true
        viewPassword.layer.cornerRadius = 20
        btnLogin.layer.cornerRadius = 15
        btnLogin.clipsToBounds = true
        
        if faceIDAvailable(){
            btnTrackID.setImage(#imageLiteral(resourceName: "iconHome").withRenderingMode(.alwaysOriginal), for: .normal)
        }else{
            btnTrackID.setImage(#imageLiteral(resourceName: "touchID").withRenderingMode(.alwaysOriginal), for: .normal)
        }
        
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
                let ac = UIAlertController(title: "Biometry unavailable", message: "Your device is not configured for biometric authentication.", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(ac, animated: true)
            }
        
    }
    
    @IBAction func clickRegister(_ sender: Any) {
    }
    
    func faceIDAvailable() -> Bool {
        if #available(iOS 11.0, *) {
            let context = LAContext()
            return (context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthentication, error: nil) && context.biometryType == .faceID)
        }
        return false
    }
}
