//
//  UITextField+Extension.swift
//  Online Test
//
//  Created by vinova on 4/2/21.
//

import UIKit

extension UITextField{
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self.text)
    }
}
