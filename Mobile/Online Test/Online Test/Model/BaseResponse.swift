//
//  BaseResponse.swift
//  F-Mail
//
//  Created by vinova on 12/22/20.
//

import ObjectMapper

// Base
class BaseResponse: Mappable {
    var code: Int?
    var status: Bool?
    var message: String?
    var data: Any?
    var metaData: Any?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        status      <- map["status"]
        message     <- map["message"]
        data        <- map["data"]
        code        <- map["code"]
        metaData <- map["metadata"]
    }
}
