//
//  MailRandomEndPoint.swift
//  F-Mail
//
//  Created by vinova on 12/22/20.
//

import Foundation
import Alamofire

enum OnlineTestEnpoint {
    
    //    case getRandomMail(count:Int)
    //    case getListInbox(mailName: String?, domain:String?)
    //    case getMailDetail(id:Int?, mailName:String?, domain:String?)
    //    case downloadAttachment(nameMail:String?, domain:String?, idMessage:Int?, fileName:String?)
    
    case getDemoApi
    
}
extension OnlineTestEnpoint: EndPointType {
    var httpMethod: HTTPMethod {
        switch self {
        //        case .getRandomMail, .getListInbox, .getMailDetail, .downloadAttachment:
        //            return .get
        
        case .getDemoApi:
            return .get
        }
    }
    
    var parameters: JSONDictionary {
        switch self {
        case .getDemoApi:
            return [:]
        }
    }
    
    var headers: HTTPHeaders? {
        return DefaultHeader().addAuthHeader()
    }
    
    
    var path: String {
        switch self {
        
        case .getDemoApi:
            return "api/subject"
        //        case .getRandomMail (let count):
        //            return "/?action=genRandomMailbox&count=\(count)"
        //        case .getListInbox(let mailName, let domain):
        //            guard let mailName = mailName, let domain = domain else {
        //                return ""
        //            }
        //            return "/?action=getMessages&login=\(mailName)&domain=\(domain)"
        //        case .getMailDetail(let id, let mailName, let domain):
        //            guard let id = id, let domain = domain, let mailName = mailName else {
        //                return ""
        //            }
        //            return "/?action=readMessage&login=\(mailName)&domain=\(domain)&id=\(id)"
        //        case .downloadAttachment(let mailName, let domain, let idMessage, let fileName):
        //            guard let mailName = mailName, let domain = domain, let idMessage = idMessage, let fileName = fileName  else {
        //                return ""
        //            }
        //            return "/?action=download&login=\(mailName)&domain=\(domain)&id=\(idMessage)&file=\(fileName)"
        //        }
        
        }
        
//        var parameters: JSONDictionary {
//            switch self {
//
//
//            case .getDemoApi:
//
//                return [:]
                
            //        case .getRandomMail (let count):
            //            let params: NSMutableDictionary = [:]
            //            params.addEntries(from: ["count":count])
            //            return params as! JSONDictionary
            //        case .getListInbox(let mailName, let domain):
            //            let params: NSMutableDictionary = [:]
            //            guard let mailName = mailName,
            //                  let domain = domain  else{return [:]}
            //            params.addEntries(from: ["login":mailName])
            //            params.addEntries(from: ["domain":domain])
            //            return params as! JSONDictionary
            //        case .getMailDetail(let id, let mailName, let domain):
            //            let params: NSMutableDictionary = [:]
            //            guard let mailName = mailName,
            //                  let domain = domain,
            //                  let id = id  else{return [:]}
            //            params.addEntries(from: ["id":id])
            //            params.addEntries(from: ["login":mailName])
            //            params.addEntries(from: ["domain":domain])
            //            return params as! JSONDictionary
            //        case .downloadAttachment(let nameMail, let domain, let idMessage, let fileName):
            //            let params: NSMutableDictionary = [:]
            //            guard let nameMail = nameMail,
            //                  let domain = domain,
            //                  let fileName = fileName,
            //                  let idMessage = idMessage   else{return [:]}
            //            params.addEntries(from: ["login":nameMail])
            //            params.addEntries(from: ["domain":domain])
            //            params.addEntries(from: ["id":idMessage])
            //            params.addEntries(from: ["file":fileName])
            //            return params as! JSONDictionary
//            }
//        }
        
    }
    
}
