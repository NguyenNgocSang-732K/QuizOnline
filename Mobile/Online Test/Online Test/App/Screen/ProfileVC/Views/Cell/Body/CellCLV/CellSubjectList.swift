//
//  CellSubjectList.swift
//  Online Test
//
//  Created by vinova on 4/1/21.
//

import UIKit

class CellSubjectList: UICollectionViewCell {
    @IBOutlet weak var lbSubject: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    func setupUI(){
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
        contentView.backgroundColor = #colorLiteral(red: 0.8274509804, green: 0.8784313725, blue: 0.9176470588, alpha: 1)
    }

}
