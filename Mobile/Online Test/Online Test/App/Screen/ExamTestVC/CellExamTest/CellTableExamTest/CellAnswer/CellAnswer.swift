//
//  CellAnswer.swift
//  Online Test
//
//  Created by vinova on 3/29/21.
//

import UIKit

class CellAnswer: UITableViewCell{

    @IBOutlet weak var lbAnswer: UILabel!
    @IBOutlet weak var lbTitleAnswer: UILabel!
    @IBOutlet weak var viewAnswer: UIView!
    
   
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
        // Initialization code
    }
    
    
    func setupUI(){
        viewAnswer.layer.cornerRadius = 20
        viewAnswer.clipsToBounds = true
        viewAnswer.backgroundColor = #colorLiteral(red: 0.8274509804, green: 0.8784313725, blue: 0.9176470588, alpha: 1)
    }
    
    func bindData(answer:Answer?){
        guard let content = answer?.content, let isSelect = answer?.isSelected else {
            return
        }
        lbTitleAnswer.text = "A"
        lbAnswer.text = content
        if isSelect{
            viewAnswer.backgroundColor = #colorLiteral(red: 0.1529411765, green: 0.4, blue: 0.4705882353, alpha: 1)
        }
        else{
            viewAnswer.backgroundColor = #colorLiteral(red: 0.8274509804, green: 0.8784313725, blue: 0.9176470588, alpha: 1)
        }
    }

}
