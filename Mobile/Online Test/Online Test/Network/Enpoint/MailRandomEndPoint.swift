//
//  MailRandomEndPoint.swift
//  F-Mail
//
//  Created by vinova on 12/22/20.
//

import Foundation
import Alamofire

enum OnlineTestEnpoint {
    
    case loginAccount(username: String?, password:String?)
    case getSubject
    case getExamList(idSubject:Int?)
    case getQuestion(idExam:Int?)
}
extension OnlineTestEnpoint: EndPointType {
    var httpMethod: HTTPMethod {
        switch self {
        case .loginAccount, .getSubject, .getExamList, .getQuestion:
            return .post
        }
    }
    
    var parameters: JSONDictionary {
        switch self {
        case .loginAccount(let username, let password):
            if let username = username, let password = password{
                let params: NSMutableDictionary = [:]
                params.addEntries(from: ["username":username])
                params.addEntries(from: ["password":password])
                return params as! JSONDictionary
            }
            else{
                return [:]
            }
        case .getSubject:
            return [:]
        case .getExamList(let idSubject):
            if let idSubject = idSubject{
                let params: NSMutableDictionary = [:]
                params.addEntries(from: ["id":idSubject])
                return params as! JSONDictionary
            }
            else{
                return [:]
            }
        case .getQuestion(let idExam):
            if let idExam = idExam{
                let params: NSMutableDictionary = [:]
                params.addEntries(from: ["id":idExam])
                return params as! JSONDictionary
            }
            else{
                return [:]
            }
        }
    }
    
    var headers: HTTPHeaders? {
        return DefaultHeader().addAuthHeader()
        
    }
    
    
    var path: String {
        switch self {
        case .loginAccount(_,_):
            return "account/checkLogin"
        case .getSubject:
            return "subject/search"
        case .getExamList:
            return "exam/search/bySubject"
            
        case .getQuestion:
            return "getQuestion/byExam"
        }
        
    }
    
}
