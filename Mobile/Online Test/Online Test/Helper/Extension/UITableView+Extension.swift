//
//  UITableView+Extension.swift
//  Online Test
//
//  Created by vinova on 3/31/21.
//

import UIKit


extension UITableView {
    
    func heightContent() -> CGFloat{
        return self.contentSize.height + self.contentInset.bottom + self.contentInset.top
    }
}
