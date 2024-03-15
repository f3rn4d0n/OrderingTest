//
//  BusinessEndpoints.swift
//  OrderingData
//
//  Created by Luis Fernando Bustos Ramírez on 15/03/24.
//

import Foundation

enum BusinessEndpoints: NetworkTargetType {
    
    case getBusiness(model: BusinessRequestModel)
    
    var baseURL: String { 
        return ApiConstants.baseURL
    }
    
    var path: String {
        return "business"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var queryParams: [URLQueryItem]? {
        return [
            .init(name: "type", value: 1),
            .init(name: "location", value: "40.7539143,-%2073.9810162"),
            .init(name: "params", value: "zones,name,slug,header,logo,schedule"),
        ]
    }
    
    var bodyParams: BodyParams? {
        return nil
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    var timeOut: Double {
        return 10
    }
    
    var sampleData: Data? {
        return nil
    }
}
