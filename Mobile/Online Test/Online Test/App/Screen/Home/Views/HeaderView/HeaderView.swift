//
//  HeaderView.swift
//  Online Test
//
//  Created by vinova on 3/29/21.
//

import UIKit

protocol TapProfileDelegate:class {
    func pushViewProfile()
}

class HeaderView: BaseViewXib {
    @IBOutlet weak var imvProfile: UIImageView!
    
    
    var delegate:TapProfileDelegate?
    
    override func setUpViews() {
        let guesTap = UITapGestureRecognizer(target: self, action: #selector(clickProfile))
        imvProfile.isUserInteractionEnabled = true
        imvProfile.addGestureRecognizer(guesTap)
    }
    
    @objc func clickProfile(){
        delegate?.pushViewProfile()
        
    }

}
