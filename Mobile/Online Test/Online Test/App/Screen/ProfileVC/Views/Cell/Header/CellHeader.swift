//
//  CellHeader.swift
//  Online Test
//
//  Created by vinova on 4/1/21.
//

import UIKit

protocol TapEditDelegate:class {
    func pushEdit()
}

class CellHeader: UITableViewCell {
    @IBOutlet weak var lbTotalUnWork: UILabel!
    @IBOutlet weak var lbTotalWorked: UILabel!
    @IBOutlet weak var lbSoccer: UILabel!
    
    @IBOutlet weak var imvUser: UIImageView!
    @IBOutlet weak var nameUser: UILabel!
    
    
    var delegate:TapEditDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI(){
        contentView.layer.cornerRadius = 30
        contentView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        contentView.backgroundColor = #colorLiteral(red: 0.8274509804, green: 0.8784313725, blue: 0.9176470588, alpha: 1)
        
        imvUser.layer.cornerRadius = UIScreen.main.bounds.width * 0.28 / 2
        imvUser.clipsToBounds = true
        
    }
    @IBAction func clickEdit(_ sender: Any) {
        self.delegate?.pushEdit()
    }
    
}
