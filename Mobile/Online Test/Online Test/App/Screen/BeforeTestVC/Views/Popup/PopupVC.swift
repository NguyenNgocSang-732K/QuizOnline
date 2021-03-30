//
//  PopupVC.swift
//  Online Test
//
//  Created by vinova on 3/29/21.
//

import UIKit

class PopupVC: BaseViewControllers {

    @IBOutlet weak var btnYes: UIButton!
    @IBOutlet weak var btnNo: UIButton!
    @IBOutlet weak var viewPopUp: UIView!
    
    var exam:ExamBase?
    
    init(exam:ExamBase?) {
        self.exam = exam
        super.init(nibName: "PopupVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupUI()

        // Do any additional setup after loading the view.
    }
    
    deinit {
        exam = nil
    }

    
   private func setupUI(){
        btnNo.layer.cornerRadius = 10
        btnYes.layer.cornerRadius = 10
        viewPopUp.layer.cornerRadius = 30
        viewPopUp.clipsToBounds = true
    }

    
    
    @IBAction func clickNo(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clickYes(_ sender: Any) {
        
        let examVC = ExamTestVC(exam: exam)
        
        
        let navRoot = UINavigationController(rootViewController: examVC)
        navRoot.modalPresentationStyle = .fullScreen
        self.present(navRoot, animated: true, completion: nil)
        
    }
}
