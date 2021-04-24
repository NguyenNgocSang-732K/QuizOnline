//
//  BaseExamModel.swift
//  Online Test
//
//  Created by vinova on 4/23/21.
//

import Foundation
import ObjectMapper

struct BaseExamModel: Mappable {
    
    var data: [Exam]?
    var statusCode: Int?
    var statusMessage: String?
    
    init?(map: Map) { }

    mutating func mapping(map: Map) {
        data <- map["data"]
        statusCode <- map["statusCode"]
        statusMessage <- map["statusMessage"]
    }
    
}
