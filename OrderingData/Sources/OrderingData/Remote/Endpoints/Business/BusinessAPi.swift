//
//  BusinessAPi.swift
//  OrderingData
//
//  Created by Luis Fernando Bustos Ramírez on 15/03/24.
//

import Foundation
import OrderingEntities

public struct BusinessAPi {
    
    let service: NetworkServiceType
    
    public init(service: NetworkServiceType) {
        self.service = service
    }
}

extension BusinessAPi: OrderingRemoteDataSourceType {
    
    public func getBusinesses(completion: @escaping(Result<[Business], Error>) -> Void) {
        let requestModel = BusinessRequestModel()
        let endpoint = BusinessEndpoints.getBusiness(model: requestModel)
        Task {
            do {
                let response: BusinessResponseModel = try await service.request(target: endpoint)
                await MainActor.run {
                    completion(.success(response.mapToBusiness()))
                }
            }
            catch {
                await MainActor.run {
                    completion(.failure(error))
                }
            }
        }
    }
}
