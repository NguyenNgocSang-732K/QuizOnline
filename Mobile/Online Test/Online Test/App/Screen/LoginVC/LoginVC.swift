//
//  LoginVC.swift
//  Online Test
//
//  Created by vinova on 3/31/21.
//

import UIKit
import LocalAuthentication

class LoginVC: BaseViewControllers {
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var viewUsername: UIView!
    
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var tfUsername: UITextField!
    
    @IBOutlet weak var btnTrackID: UIButton!
    
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
        
        if faceIDAvailable(){
            btnTrackID.setImage(#imageLiteral(resourceName: "iconHome").withRenderingMode(.alwaysOriginal), for: .normal)
        }else{
            btnTrackID.setImage(#imageLiteral(resourceName: "touchID").withRenderingMode(.alwaysOriginal), for: .normal)
        }
        
        tfUsername.delegate = self
        tfPassword.delegate = self
        
    }
    
    @IBAction func clickLogin(_ sender: Any) {
        
        let examVC = UINavigationController(rootViewController: ExamTestVC(questions: nil, time: 40))
        
        examVC.modalPresentationStyle = .fullScreen
        
        self.present(examVC, animated: true, completion: nil)
        
//        Provider.shared.getSubject.loginAccount(username: tfUsername.text, password: tfPassword.text) { loginUser in
//            if let token = loginUser?.data?.first?.token{
//
//                UserDefaults.standard.setValue(token, forKey: "token")
//                AppRouter.shared.gotoHome()
//            }
//        } failure: { err in
//            print(err?.code)
//        }

        

        
        
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



extension LoginVC:UITextFieldDelegate{
    
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        let rect = scrollView.contentOffset
//        scrollView.setContentOffset(CGPoint(x: rect.x, y: rect.y + 130), animated: true)
//        return true
//    }
   

}
