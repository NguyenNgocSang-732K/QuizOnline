//
//  Network.swift
//  F-Mail
//
//  Created by vinova on 12/22/20.
//

import Foundation
import ObjectMapper
import Alamofire
import KRProgressHUD
/***
 Input: endPoint (all info to request)
 Ouput: BaseResponse or error
 ***/

protocol APINetworkProtocol {
    func getDemoApi(endPoint: EndPointType, success: @escaping NetworkArrJSONSuccess, failure: @escaping RequestFailure)
    
}

struct APINetwork: APINetworkProtocol {
    
    
    let request: NetworkRequestProtocol
    
    init(request: NetworkRequestProtocol) {
        self.request = request
    }
    func getDemoApi(endPoint: EndPointType, success: @escaping NetworkArrJSONSuccess, failure: @escaping RequestFailure){
        
        print("URL: \(BASE_URL)\(endPoint.path)")
        print(endPoint.parameters)
        if Reachability.isConnectedToNetwork() {
            request.getDemoApi(endPoint: endPoint, success: { data in
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [[String: AnyObject]] {
                        print("*******************JSON Result************************")
                        print(json)
                        print("*******************END************************")
                        
                        self.handleJSONSubjectList(response: json, success: success, failure: failure)
                        
                    }
                } catch let error as NSError {
                    KRProgressHUD.dismiss {
                        let popUp = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                        
                        PopupHelper.shared.showPopError(popUp: popUp) { (controller) in
                            popUp.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
                                controller?.dismiss(animated: true, completion: nil)
                            }))
                        }
                        
                        
                    }
                    print(error.localizedDescription)
                }
            }) { error in
                if let _error = error {
                    if _error.message == "The Internet connection appears to be offline." {

                    } else {
                        print("APINetwork - requestData: \(String(describing: error?.message?.description))")
                    }
                    failure(APIError(error: error))
                }
            }
        } else {
            KRProgressHUD.dismiss {
                let popUp = UIAlertController(title: "Error", message: "Internet Disconect", preferredStyle: .alert)
                
                PopupHelper.shared.showPopError(popUp: popUp) { (controller) in
                    popUp.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
                        controller?.dismiss(animated: true, completion: nil)
                    }))
                }
                
                
            }
        }


        
    }

}

// handle base response
extension APINetwork {
    private func handleJSONResponse(response: [String: AnyObject], success: @escaping NetworkJSONSuccess, failure: @escaping RequestFailure) {
        success(response)
    }
    
    
    private func handleJSONSubjectList(response: [[String: AnyObject]], success: @escaping NetworkArrJSONSuccess, failure: @escaping RequestFailure) {
        success(response)
    }
}
