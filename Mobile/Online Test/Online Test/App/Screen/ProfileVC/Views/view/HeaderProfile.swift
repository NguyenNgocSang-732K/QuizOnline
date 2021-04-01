//
//  HeaderView.swift
//  Online Test
//
//  Created by vinova on 3/29/21.
//

import UIKit

protocol TapActiontDelegate:class {
    func pushLogin()
    func pushBack()
}

class HeaderProfile: BaseViewXib {
   
    @IBOutlet weak var btnLogOut: UIStackView!
    
    var delegate:TapActiontDelegate?
   
    
    override func setUpViews() {
        let guesTap = UITapGestureRecognizer(target: self, action: #selector(clickLogOut))
        btnLogOut.isUserInteractionEnabled = true
        btnLogOut.addGestureRecognizer(guesTap)
    }
    
    @objc func clickLogOut(){
        delegate?.pushLogin()
        
    }

    @IBAction func clickBack(_ sender: Any) {
        delegate?.pushBack()
    }
}
