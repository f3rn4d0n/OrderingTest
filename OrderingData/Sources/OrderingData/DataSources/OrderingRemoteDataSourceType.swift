//
//  OrderingRemoteDataSourceType.swift
//  OrderingData
//
//  Created by Luis Fernando Bustos Ramírez on 15/03/24.
//

import Foundation
import OrderingEntities

public protocol OrderingRemoteDataSourceType {
    
    func getBusinesses(completion: @escaping(Result<[Business], Error>) -> Void)
}
