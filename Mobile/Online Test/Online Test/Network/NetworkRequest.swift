//
//  NetworkRequest.swift
//  F-Mail
//
//  Created by vinova on 12/22/20.
//


import Alamofire


//public var BASE_URL = URL(string: "https://www.1secmail.com/api/v1")!
public var BASE_URL = URL(string: "https://5fd251f68cee610016adf38d.mockapi.io/")!

//---
typealias RequestSuccess = (_ data: Data) -> Void
typealias RequestFailure = (_ error: APIError?) -> Void

//---
typealias NetworkJSONSuccess = (_ data: [String: AnyObject] ) -> Void

typealias NetworkArrJSONSuccess = (_ data: [[String: AnyObject]] ) -> Void

//---
struct SuccessHandler<T> {
    typealias object = (_ object: T?) -> Void
    typealias array = (_ array: [T]) -> Void
    typealias anyObject = (_ object: Any?) -> Void
}

// NetworkPotocol
protocol NetworkRequestProtocol {
    func getDemoApi(endPoint: EndPointType, success: @escaping RequestSuccess, failure: @escaping RequestFailure)
}

//---
struct NetworkRequest: NetworkRequestProtocol {
    
    
    static let configuration: URLSessionConfiguration = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 600 // seconds
        configuration.timeoutIntervalForResource = 600
        return configuration
    }()
    
    func getDemoApi(endPoint: EndPointType, success: @escaping RequestSuccess, failure: @escaping RequestFailure) {
        
        let url = makeUrl(path: endPoint.path)
        
        let encoding = getAlamofireEncoding(httpMethod: endPoint.httpMethod)
        
        let request = Alamofire.request(url, method: endPoint.httpMethod, parameters: endPoint.parameters, encoding: encoding, headers: endPoint.headers)
        request.responseData { (dataResponse) in
            switch dataResponse.result {
            case .success(let data):
                success(data)
            case .failure(let error):
                let apiError = APIError(error: error)
                failure(apiError)
            }
        }
        
    }
    
    func uploadImage(endPoint: EndPointType, success: @escaping RequestSuccess, failure: @escaping RequestFailure) {
        let url = makeUrl(path: endPoint.path)
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 120
        manager.session.configuration.timeoutIntervalForRequest = 120
        manager.upload(multipartFormData: { multipartFormData in
            for (key, value) in endPoint.parameters {
                if value is UIImage{
                    if let image = value as? UIImage, let data  = image.jpegData(compressionQuality: 0.2) {
                        let now = Int64(Date().timeIntervalSince1970 * 1000)
                        multipartFormData.append(data, withName: key, fileName: "\(key)\(now)", mimeType: "image/png")
                    }
                } else if value is [UIImage]{
                    
                    if let images = value as? [UIImage] {
                        for image in images {
                            if let data = image.jpegData(compressionQuality: 0.2) {
                                print("size of image and name:", Double(data.count), key)
                                    multipartFormData.append(data, withName: key, fileName: "\(Date().timeIntervalSince1970).png", mimeType: "image/png")
                            }
                        }
                    }
                    
                } else if value is String || value is Int || value is Float || value is Double {
                    if let data = "\(value)".data(using: String.Encoding.utf8) {
                        multipartFormData.append(data, withName: key)
                    }
                } else if value is [Int] {
                    if let data = value as? [Int] {
                        for valueArr in data{
                            if let dataArr = "\(valueArr)".data(using: String.Encoding.utf8) {
                                multipartFormData.append(dataArr, withName: key)
                            }
                        }
                    }
                } else if value is [String] {
                    if let data = value as? [String] {
                        for value in data{
                            if let codeData = value.data(using: String.Encoding.utf8) {
                                multipartFormData.append(codeData, withName: key)
                            }
                        }
                    }
                }
            }
        }, to: url, method: endPoint.httpMethod, headers: endPoint.headers) { (encodingResult) in
            switch encodingResult {
            case .failure(let error):
                let apiError = APIError(error: error)
                failure(apiError)
            case .success(let upload, _, _):
                upload.uploadProgress(closure: { progress in
                    let progress = Int(Double(progress.fractionCompleted) * 100)
                    print("\(progress)" + "%")
                })
//                upload.responseString { (response) in
//                    print(response)
////                    if let data = response.data {
////                        success(data)
////                    }
//                    success(response.data!)
//                }
                upload.responseJSON { (response) in
                    if let data = response.data {
                        success(data)
                    }
                }
            }
        }
    }
}

// MARK: helper NetworkRequest
extension NetworkRequest {
    private func getAlamofireEncoding(httpMethod: HTTPMethod) -> ParameterEncoding {
        switch httpMethod {
        case .get:
            return URLEncoding.default
        case .post:
            return JSONEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    private func makeUrl(path: String) -> String {
        return "\(BASE_URL)\(path)"
    }
}


