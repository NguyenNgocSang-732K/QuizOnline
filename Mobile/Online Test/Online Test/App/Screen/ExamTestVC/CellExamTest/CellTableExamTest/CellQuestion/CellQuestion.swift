//
//  CellTableExamTest.swift
//  Online Test
//
//  Created by vinova on 3/29/21.
//

import UIKit


class CellQuestion: UITableViewCell {
    @IBOutlet weak var txtQuestion: UILabel!
    
    @IBOutlet weak var imvQuestion: UIImageView!
    @IBOutlet weak var heightTextView: NSLayoutConstraint!
    
//    @IBOutlet weak var stackV: UIStackView!
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
        

        
    }
    
    func setupUI() {
//        stackV.layer.cornerRadius = 20
//        stackV.clipsToBounds = true
    }
    
    
    func bindData(question:String?){
        txtQuestion.text = question
        let height = question?.heightForView(font: UIFont.systemFont(ofSize: 15), width: 414)
        heightTextView.constant = height!
        imvQuestion.image = #imageLiteral(resourceName: "1222")

        
        
    }
    
    

}




