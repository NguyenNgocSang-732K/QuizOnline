//
//  MapperData.swift
//  F-Mail
//
//  Created by vinova on 12/22/20.
//

import Foundation
import ObjectMapper


struct MapperData {
    
    // MARK: MAP JSON OBJECT
    static func mapObject<T: BaseMappable>(_ successHandler: @escaping SuccessHandler<T>.object) -> NetworkJSONSuccess {
        return { baseResponse in
            let obj = Mapper<T>().map(JSONObject: baseResponse)
            successHandler(obj)
        }
    }
    
    static func mapObjectHasMetaData<T: BaseMappable>(_ successHandler: @escaping SuccessHandler<T>.object) -> NetworkJSONSuccess {
        return { baseResponse in
            let obj = Mapper<T>().map(JSONObject: baseResponse)
            successHandler(obj)
         }
    }
    
    static func mapArray<T: BaseMappable>(_ successHandler: @escaping SuccessHandler<T>.array) -> NetworkJSONSuccess {
        return { baseResponse in
            let obj = Mapper<T>().mapArray(JSONObject: baseResponse["data"])
            if let obj = obj {
                 successHandler(obj)
            } else {
                successHandler([])
            }
            
        }
    }
    static func mapArrayJson<T: BaseMappable>(_ successHandler: @escaping SuccessHandler<T>.array) -> NetworkArrJSONSuccess {
        return { baseResponse in
            let obj = Mapper<T>().mapArray(JSONArray: baseResponse)
            if obj.count > 0{
                successHandler(obj)
            }
            else{
                successHandler([])
            }
            
        }
        
    }
    
    static func mapTokenJson<T: BaseMappable>(_ successHandler: @escaping SuccessHandler<T>.object) -> NetworkTokenJSONSuccess {
        return { baseResponse in
            let obj = Mapper<T>().map(JSONString: baseResponse)
            successHandler(obj)
            
        }
    }
    static func mapArrayNoData<T: BaseMappable>(_ successHandler: @escaping SuccessHandler<T>.array) -> NetworkJSONSuccess {
        return { baseResponse in
            let obj = Mapper<T>().mapArray(JSONObject: baseResponse)
            if let obj = obj {
                 successHandler(obj)
            } else {
                successHandler([])
            }
            
        }
    }
}
