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
        var header: [String: String] = ["Content-Type": "application/json"]
        
        if let token = UserDefaults.standard.object(forKey: "token") as? String {
           print("Token", token)
           header["token"] = token
        }
        return header
    }
}
