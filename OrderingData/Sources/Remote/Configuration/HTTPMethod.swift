//
//  HTTPMethod.swift
//  OrderingData
//
//  Created by Luis Fernando Bustos Ramírez on 15/03/24.
//

import Foundation

public enum HTTPMethod: String {
    case get
    case post
    case put
    case delete
}

public typealias HTTPHeaders = [String: String]

public typealias BodyParams = [String: Any]
