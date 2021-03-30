//
//  BeforeTestVC.swift
//  Online Test
//
//  Created by vinova on 3/29/21.
//

import UIKit

class BeforeTestVC: BaseViewControllers {

    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var tfTitle: UITextView!
    
    var exam:ExamBase?
    
    
    init(exam:ExamBase?) {
        
        self.exam = exam
        super.init(nibName: "BeforeTestVC", bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        exam = nil
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupUI()
        // Do any additional setup after loading the view.
    }

    
    func setupUI(){
        changeBackgroundColor()
        changeLeftButton(title: nil, image: #imageLiteral(resourceName: "back"))
        btnStart.layer.cornerRadius = 20
        
    }

    override func clickLeftBtn() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clickStart(_ sender: Any) {
        let popUp = PopupVC(exam: exam)
        
        popUp.modalPresentationStyle = .fullScreen
        
        self.present(popUp, animated: true, completion: nil)
        
    }
    
}
