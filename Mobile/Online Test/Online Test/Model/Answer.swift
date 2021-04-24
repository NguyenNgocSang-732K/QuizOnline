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
    var createdBy: Int?
    var createdDate: String?
    var id: Int?
    var iscorrect: Bool?
    var status: Int?
    var isSelected:Bool = false
    
    init(content: String?, createdBy: Int?, createdDate: String?, id: Int?, iscorrect: Bool?, status: Int?) {
        self.content = content
        self.createdBy = createdBy
        self.createdDate = createdDate
        self.id = id
        self.iscorrect = iscorrect
        self.status = 1
    }
    
    init?(map: Map) { }
    mutating func selected(isSelected:Bool){
        self.isSelected = isSelected
    }
    
    mutating func mapping(map: Map) {
        content <- map["content"]
        createdBy <- map["createdBy"]
        createdDate <- map["createdDate"]
        id <- map["id"]
        iscorrect <- map["iscorrect"]
        status <- map["status"]
    }
    
}
