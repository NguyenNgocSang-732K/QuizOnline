//
//  EndPointType.swift
//  F-Mail
//
//  Created by vinova on 12/22/20.
//

import Foundation
import Alamofire

typealias JSONDictionary = [String: Any]

protocol EndPointType {
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var parameters: JSONDictionary { get }
    var headers: HTTPHeaders? { get }
}

struct DefaultHeader {
    func addAuthHeader() -> [String: String] {
        let header: [String: String] = ["Content-Type": "application/json"]
        return header
    }
}
