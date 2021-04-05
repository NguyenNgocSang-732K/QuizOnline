//
//  CellHome.swift
//  Online Test
//
//  Created by vinova on 3/29/21.
//

import UIKit

class CellHome: UICollectionViewCell {
    @IBOutlet weak var imvSubject: UIImageView!
    @IBOutlet weak var nameSubject: UILabel!
    @IBOutlet weak var titleTotal: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imvSubject.image = UIImage()
        nameSubject.text = nil
        titleTotal.text = nil
    }
    
    
   func setupUI(){
    contentView.clipsToBounds = true
    contentView.backgroundColor = #colorLiteral(red: 0.8274509804, green: 0.8784313725, blue: 0.9176470588, alpha: 1)
    contentView.layer.cornerRadius = 20
    
   }
    
    func bindData(subject:Subject?){
        guard let subject = subject else {
            return
        }
//        imvSubject.image = subject.imageSubject
        nameSubject.text = subject.name
        titleTotal.text = subject.createDate
    }
    

}
