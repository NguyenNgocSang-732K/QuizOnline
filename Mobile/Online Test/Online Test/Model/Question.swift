//
//  Question.swift
//  Online Test
//
//  Created by vinova on 4/5/21.
//

import Foundation
import ObjectMapper

struct Question: Mappable {
    
        var answers: [Answer]?
        var answerType: Int?
        var content: String?
        var createdBy: Int?
        var createdDate: String?
        var id: Int?
        var image: String?
        var level: Level?
        var status: Int?
        var totalAnswer: Int?
        var userAnswer: [Answer]?
    
    init(answers:[Answer]?,answerType: Int?, content: String?, createdBy: Int?, createdDate: String?, id: Int?, image: String?, level: Level?, status: Int?, totalAnswer: Int?, userAnswer: [Answer]?) {
        self.answers = answers
        self.answerType = answerType
        self.content = content
        self.createdBy = createdBy
        self.createdDate = createdDate
        self.id = id
        self.image = image
        self.level = level
        self.status = status
        self.totalAnswer = totalAnswer
        self.userAnswer = userAnswer
    }
        
        init?(map: Map) { }

        mutating func mapping(map: Map) {
        answers <- map["answers"]
        answerType <- map["answerType"]
        content <- map["content"]
        createdBy <- map["createdBy"]
        createdDate <- map["createdDate"]
        id <- map["id"]
        image <- map["image"]
        level <- map["level"]
        status <- map["status"]
        totalAnswer <- map["totalAnswer"]
        userAnswer <- map["userAnswer"]
        }
    
    
    
    
}
