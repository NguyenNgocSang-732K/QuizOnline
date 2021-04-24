//
//  QuestionBaseModel.swift
//  Online Test
//
//  Created by vinova on 4/24/21.
//

import Foundation
import ObjectMapper

struct QuestionBaseModel: Mappable {
    
    var data: [Question]?
    var statucCode: Int?
    var statusMessage: String?
    
    init?(map: Map) { }

    mutating func mapping(map: Map) {
        data <- map["data"]
        statucCode <- map["statucCode"]
        statusMessage <- map["statusMessage"]
    }
    
}
