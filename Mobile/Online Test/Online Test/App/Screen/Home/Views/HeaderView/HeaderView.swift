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
    
    @IBOutlet weak var vStack: UIStackView!
    
    var delegate:TapProfileDelegate?
    
    override func setUpViews() {
        let guesTap = UITapGestureRecognizer(target: self, action: #selector(clickProfile))
        vStack.isUserInteractionEnabled = true
        vStack.addGestureRecognizer(guesTap)
        imvProfile.layer.cornerRadius = 25
    }
    
    @objc func clickProfile(){
        delegate?.pushViewProfile()
        
    }

}
