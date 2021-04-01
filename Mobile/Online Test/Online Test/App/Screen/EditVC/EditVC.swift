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
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    
    let arrSex = ["Nam", "Nu"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupUI()

        // Do any additional setup after loading the view.
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
        tfName.delegate = self
        tfMail.delegate = self
        tfPhone.delegate = self
        tfBirthday.delegate = self
    }
    
    @IBAction func clickSave(_ sender: Any) {
        
    }
    
    @objc func clickImage(){
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
                alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
                    self.openCamera()
                }))

                alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
                    self.openGallery()
                }))

                alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))

                self.present(alert, animated: true, completion: nil)
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

    func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have permission to access gallery.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    
  

}
extension EditVC:UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[.originalImage] as? UIImage {
            imvProfile.image = pickedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
}

extension EditVC:UITextFieldDelegate{
    
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        let rect = scrollView.contentOffset
//        
//        if scrollView.contentSize.height >= rect.y{
//            self.scrollView.setContentOffset(CGPoint(x: rect.x, y: rect.y), animated: true)
//        }
//        else{
//            self.scrollView.setContentOffset(CGPoint(x: rect.x, y: rect.y + 100), animated: true)
//        }
//        
//        return true
//    }

}
