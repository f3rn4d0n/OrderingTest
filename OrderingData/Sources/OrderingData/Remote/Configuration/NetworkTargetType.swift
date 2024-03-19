//
//  NetworkTargetType.swift
//  OrderingData
//
//  Created by Luis Fernando Bustos Ramírez on 15/03/24.
//

import Foundation

import Foundation

public protocol NetworkTargetType {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var queryParams: [URLQueryItem]? { get }
    var bodyParams: BodyParams? { get }
    var headers: HTTPHeaders? { get }
    var timeOut: Double { get }
}
