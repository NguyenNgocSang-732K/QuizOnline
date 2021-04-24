//
//  Exam.swift
//  Online Test
//
//  Created by vinova on 3/29/21.
//

import Foundation
import ObjectMapper

struct Exam: Mappable {
    
    var code: String?
    var createdBy: Int?
    var createdDate: String?
    var examDone: Bool?
    var id: Int?
    var level: Level?
    var name: String?
    var status: Int?
    var totalQuestion: Int?
    var totalQuestionTrue: Int?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        code <- map["code"]
        createdBy <- map["createdBy"]
        createdDate <- map["createdDate"]
        examDone <- map["examDone"]
        id <- map["id"]
        level <- map["level"]
        name <- map["name"]
        status <- map["status"]
        totalQuestion <- map["totalQuestion"]
        totalQuestionTrue <- map["totalQuestionTrue"]
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
