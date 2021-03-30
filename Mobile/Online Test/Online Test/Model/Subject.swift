//
//  Subject.swift
//  Online Test
//
//  Created by vinova on 3/29/21.
//

import Foundation
import UIKit

class Subject{
    var id:String? = ""
    var nameSubject:String? = ""
    var imageSubject:UIImage? = UIImage()
    var total:String? = ""
    
    init(id:String?, nameSubject:String?, imageSubject:UIImage?, total:String?  ) {
        self.id = id
        self.nameSubject = nameSubject
        self.imageSubject = imageSubject
        self.total = total
    }
}
