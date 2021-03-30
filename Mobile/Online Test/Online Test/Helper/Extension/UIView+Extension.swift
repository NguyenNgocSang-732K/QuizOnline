//
//  UIView+Extension.swift
//  HotelBooking
//
//  Created by vinova on 3/24/21.
//

import UIKit

extension UIView{
    func fillHorizontalSuperview(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
//                if #available(iOS 11, *) {
//                    leftAnchor.constraint(equalTo: superview.leftAnchor, constant: constant).isActive = true
//                    rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -constant).isActive = true
//                } else {
                leftAnchor.constraint(equalTo: superview.leftAnchor, constant: constant).isActive = true
                rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -constant).isActive = true
            //}
        }
    }
    
    func fillVerticalSuperview(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
//                if #available(iOS 11, *) {
//                    topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: constant).isActive = true
//                    bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor, constant: -constant).isActive = true
//                } else {
                topAnchor.constraint(equalTo: superview.topAnchor, constant: constant).isActive = true
                bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -constant).isActive = true
//                }
            
        }
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
    }
}
func instanceFromNib<T: UIView>() -> T  where T: ATIdentifiable {
    return UINib(nibName: T.identifier, bundle: nil)
        .instantiate(withOwner: nil, options: nil)[0] as! T
}

protocol ATIdentifiable {
    
    /// Identifer
    static var identifier: String { get }
}

extension ATIdentifiable {
    static var identifier: String {
        return String(describing: Self.self)
    }
}
