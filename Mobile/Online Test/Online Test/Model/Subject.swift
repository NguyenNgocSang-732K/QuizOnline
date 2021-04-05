//
//  Subject.swift
//  Online Test
//
//  Created by vinova on 3/29/21.
//

//
//class Subject{
//    var id:String? = ""
//    var nameSubject:String? = ""
//    var imageSubject:UIImage? = UIImage()
//    var total:String? = ""
//    
//    init(id:String?, nameSubject:String?, imageSubject:UIImage?, total:String?  ) {
//        self.id = id
//        self.nameSubject = nameSubject
//        self.imageSubject = imageSubject
//        self.total = total
//    }
//}

import Foundation
import ObjectMapper

struct Subject: Mappable {
    
    var createBy: Int?
    var createDate: String?
    var exams: [Exam]?
    var id: String?
    var name: String?
    var status: Bool?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        createBy <- map["create_by"]
        createDate <- map["create_date"]
        exams <- map["exams"]
        id <- map["id"]
        name <- map["name"]
        status <- map["status"]
    }
    
}
