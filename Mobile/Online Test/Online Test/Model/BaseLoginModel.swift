//
//  BaseLoginModel.swift
//  Online Test
//
//  Created by vinova on 4/24/21.
//

import Foundation
import ObjectMapper

struct LoginBaseModel: Mappable {
    
    var data: [LoginModel]?
    var statucCode: Int?
    var statusMessage: String?
    
    init?(map: Map) { }

    mutating func mapping(map: Map) {
    data <- map["data"]
    statucCode <- map["statucCode"]
    statusMessage <- map["statusMessage"]
    }
    
}

struct LoginModel: Mappable {
    
    var token: String?
    
    init?(map: Map) { }

    mutating func mapping(map: Map) {
        token <- map["token"]
    }
    
}
