//
//  Question.swift
//  Online Test
//
//  Created by vinova on 4/5/21.
//

import Foundation
import ObjectMapper

struct Question: Mappable {
    
    var answer: [Answer]?
    var answerType: Int?
    var content: String?
    var id: Int?
    var image: String?
    var level: Int?
    
    init?(map: Map) { }

    mutating func mapping(map: Map) {
    answer <- map["answer"]
    answerType <- map["answer_type"]
    content <- map["content"]
    id <- map["id"]
    image <- map["image"]
    level <- map["level"]
    }
    
}
