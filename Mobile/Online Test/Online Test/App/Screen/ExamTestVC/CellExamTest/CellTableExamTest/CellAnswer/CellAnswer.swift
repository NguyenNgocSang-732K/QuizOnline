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

}
