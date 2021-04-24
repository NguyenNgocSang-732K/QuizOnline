//
//  UIImage+Extension.swift
//  Online Test
//
//  Created by vinova on 4/24/21.
//

import Foundation
import UIKit


extension UIImageView {
    func load(nameImage: String) {
        let url:URL = URL(string: BASE_URLImage+nameImage)!
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
}
