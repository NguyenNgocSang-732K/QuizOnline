//
//  Exam.swift
//  Online Test
//
//  Created by vinova on 3/29/21.
//

import Foundation
import ObjectMapper

struct Exam: Mappable {
    
    var id: Int?
    var code: String?
    var name: String?
    var status: Int?
    var createdDate: String?
    var createdBy: Int?
    var level: Level?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        code <- map["code"]
        name <- map["name"]
        status <- map["status"]
        createdDate <- map["createdDate"]
        createdBy <- map["createdBy"]
        level <- map["level"]
    }
}
struct Level: Mappable {
    
    var id: Int?
    var name: String?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
    
}
