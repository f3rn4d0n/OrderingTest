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
                    switch (error as? URLError)?.code {
                    case .some(.timedOut):
                        completion(.failure(NetworkError.timeout))
                    case .some(.notConnectedToInternet):
                        completion(.failure(NetworkError.noInternet))
                    default:
                        completion(.failure(error))
                    }
                }
            }
        }
    }
}
