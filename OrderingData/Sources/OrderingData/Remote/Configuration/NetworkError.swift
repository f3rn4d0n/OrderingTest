//
//  NetworkError.swift
//  OrderingData
//
//  Created by Luis Fernando Bustos Ramírez on 15/03/24.
//

import Foundation

public enum NetworkError: Error, LocalizedError {
    case invalidURL
    case invalidStatus(code: Int)
    case invalidResponse
    case dataConversionFailure(error: String)
    case noInternet
    case timeout

    public var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidStatus:
            return "Invalid app response status"
        case .invalidResponse:
            return "Invalid data response"
        case .dataConversionFailure:
            return "The information seems to be different, please update your application version"
        case .noInternet:
            return "No internet detected, verify your connection"
        case .timeout:
            return "Your request exceeded the waiting time, please check your internet connection"
        }
    }
    
    public var errorDescription: String? { return localizedDescription }
}
