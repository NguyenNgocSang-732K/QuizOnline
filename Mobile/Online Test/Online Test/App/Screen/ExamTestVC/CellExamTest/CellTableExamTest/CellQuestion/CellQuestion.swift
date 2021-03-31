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
 
    @IBOutlet weak var viewStack: UIView!

   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
        

        
    }
    
    func setupUI() {
        viewStack.layer.cornerRadius = 30
        viewStack.clipsToBounds = true
    }
    
    
    func bindData(question:String?){
        txtQuestion.text = question
        imvQuestion.image = #imageLiteral(resourceName: "1222")

        
        
    }
    
    

}




