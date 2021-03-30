//
//  CellExam.swift
//  Online Test
//
//  Created by vinova on 3/29/21.
//

import UIKit

class CellExam: UICollectionViewCell {

    @IBOutlet weak var titleExam: UILabel!
    @IBOutlet weak var lbTotalCheck: UILabel!
    @IBOutlet weak var lbTotalUncheck: UILabel!
    @IBOutlet weak var viewPoint: UIView!
    @IBOutlet weak var lbPoint: UILabel!
    @IBOutlet weak var hStackCheck: UIStackView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
        // Initialization code
    }

    
    func setupUI(){
        contentView.backgroundColor = #colorLiteral(red: 0.8274509804, green: 0.8784313725, blue: 0.9176470588, alpha: 1)
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 20
        viewPoint.layer.cornerRadius = 20
    }
    
    func bindData(examBase:ExamBase?){
        guard let examBase = examBase else {
            return
        }
        titleExam.text = examBase.nameExam
    }
}
