//
//  GetBusinessUseCase.swift
//
//
//  Created by Luis Fernando Bustos Ramírez on 15/03/24.
//

import Foundation
import OrderingEntities
import OrderingData

public protocol GetBusinessUseCaseType {
    
    func execute(completion: @escaping(Result<Business, Error>) -> Void)
}

public class GetBusinessUseCase: GetBusinessUseCaseType {
    
    public init() { }
    
    public func execute(completion: @escaping(Result<Business, Error>) -> Void) {
        let api = BusinessAPi(service: RequestNetworkProvider())
        api.getBusinesses(completion: completion)
    }
}
