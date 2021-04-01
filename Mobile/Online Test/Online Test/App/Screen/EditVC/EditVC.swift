//
//  EditVC.swift
//  Online Test
//
//  Created by vinova on 4/1/21.
//

import UIKit

class EditVC: BaseViewControllers {
    @IBOutlet weak var btnImage: UIView!
    @IBOutlet weak var imvProfile: UIImageView!
    @IBOutlet var viewInput: [UIView]!
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var dropDownSex: DropDown!
    
    @IBOutlet weak var tfPhone: UITextField!
    
    @IBOutlet weak var tfMail: UITextField!
    
    @IBOutlet weak var tfBirthday: UITextField!
    
    @IBOutlet weak var spaceBottom: NSLayoutConstraint!
    
    @IBOutlet weak var btnSave: UIButton!
    
    
    let arrSex = ["Nam", "Nu"]
    
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
        btnImage.layer.cornerRadius = UIScreen.main.bounds.width * 0.28 / 2
        btnImage.clipsToBounds = true
        
        let tapG = UITapGestureRecognizer(target: self, action: #selector(clickImage))
        btnImage.addGestureRecognizer(tapG)
        viewInput.forEach { (view) in
            view.layer.cornerRadius = 25
            view.clipsToBounds = true
        }
        dropDownSex.layer.cornerRadius = 20
        dropDownSex.isSearchEnable = false
        dropDownSex.optionArray = arrSex
        dropDownSex.didSelect{(selectedText , index , id) in
            //
        }
        dropDownSex.text = arrSex[0]
        
        btnSave.layer.cornerRadius = 25
        btnSave.clipsToBounds = true
    }
    
    @IBAction func clickSave(_ sender: Any) {
        
    }
    
    @objc func clickImage(){
        print("asdada")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
