//
//  Answer.swift
//  Online Test
//
//  Created by vinova on 4/5/21.
//

import Foundation
import ObjectMapper

struct Answer: Mappable {
    
    var content: String?
    var id: Int?
    var iscorrect: Bool?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        content <- map["content"]
        id <- map["id"]
        iscorrect <- map["iscorrect"]
    }
    
}
