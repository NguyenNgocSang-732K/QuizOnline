//
//  SubjectApiService.swift
//  F-Mail
//
//  Created by vinova on 04/05/21.
//

import Foundation

protocol SubjectAPIServiceProtocol {
    
    
    func getSubject(success: @escaping SuccessHandler<Subject>.array, failure: @escaping RequestFailure)
    func loginAccount(username:String?, password:String?, success: @escaping ((String)->Void), failure: @escaping RequestFailure)
    func getExamBySubject(idSubject:Int?, success: @escaping  SuccessHandler<Exam>.array, failure: @escaping RequestFailure)
    
}

class SubjectApiService: SubjectAPIServiceProtocol {
    
    
    
    
    private let network: APINetworkProtocol
    
    init(network: APINetworkProtocol) {
        self.network = network
    }
    
    
    
    func getSubject(success: @escaping SuccessHandler<Subject>.array , failure: @escaping RequestFailure) {
        let endPoint = OnlineTestEnpoint.getSubject
        network.getSubject(endPoint: endPoint, success: MapperData.mapArrayJson(success), failure: failure)
    }
    func loginAccount(username: String?, password: String?, success: @escaping ((String)->Void), failure: @escaping RequestFailure) {
        let endPoint = OnlineTestEnpoint.loginAccount(username: username, password: password)
        network.loginAccount(endPoint: endPoint, username: username, password: password, success: success, failure: failure)
    }
    
    func getExamBySubject(idSubject: Int?, success: @escaping SuccessHandler<Exam>.array, failure: @escaping RequestFailure) {
        let endPoint = OnlineTestEnpoint.getExamList(idSubject: idSubject)
        network.getExamBySubject(idSubject: idSubject, endPoint: endPoint, success: MapperData.mapArrayJson(success), failure: failure)
    }
    
    
    
    
//    func getRandomMail(count: Int, success: @escaping (([String])->Void), failure: @escaping RequestFailure) {
//        let endPoint = MailEndPoint.getRandomMail(count: count)
//        network.requestMail(endPoint: endPoint, success: success, failure: failure)
//    }
//
//    func getListInbox(mailName: String?, domain: String?, success: @escaping SuccessHandler<MailRandom>.array, failure: @escaping RequestFailure) {
//        let endPoint = MailEndPoint.getListInbox(mailName: mailName, domain: domain)
//        network.requestMailList(endPoint: endPoint, success: MapperData.mapArrayMailList(success), failure: failure)
//    }
//
//    func getMailDetail(id: Int?, mailName: String?, domain: String?, success: @escaping SuccessHandler<MailRandom>.object, failure: @escaping RequestFailure) {
//        let endPoint = MailEndPoint.getMailDetail(id: id, mailName: mailName, domain: domain)
//        network.requestData(endPoint: endPoint, success: MapperData.mapObject(success), failure: failure)
//    }
//    func downloadAttachment(nameMail: String?, domain: String?, idMessage: Int?, fileName: String?, willSuccess: @escaping ((Int) -> Void), success: @escaping ((Data)->Void), failure: @escaping RequestFailure) {
//        let endPoint = MailEndPoint.downloadAttachment(nameMail: nameMail, domain: domain, idMessage: idMessage, fileName: fileName)
//        network.downloadAttachment(endPoint: endPoint, willSuccess: willSuccess, success: success, failure: failure)
//    }
//
    
}
