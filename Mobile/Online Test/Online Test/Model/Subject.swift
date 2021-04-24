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
    
    
        var createdBy: Int?
        var createdDate: String?
        var id: Int?
        var image: String?
        var name: String?
        var status: Int?
        var totalExam: Int?
        var totalExamUserDone: Int?
        
        init?(map: Map) { }

        mutating func mapping(map: Map) {
        createdBy <- map["createdBy"]
        createdDate <- map["createdDate"]
        id <- map["id"]
        image <- map["image"]
        name <- map["name"]
        status <- map["status"]
        totalExam <- map["totalExam"]
        totalExamUserDone <- map["totalExamUserDone"]
        }
    
}
