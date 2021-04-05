//
//  Provider.swift
//  F-Mail
//
//  Created by vinova on 12/22/20.
//

class Provider {
    static let shared = Provider()
    
    private let request: NetworkRequestProtocol = NetworkRequest()
    
    private var networkManager: APINetworkProtocol {
        return APINetwork(request: request)
    }
    
    
    var getSubject: SubjectApiService {
        return SubjectApiService(network: networkManager)
    }
}
