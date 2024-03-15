//
//  BusinessResponseModel.swift
//  OrderingData
//
//  Created by Luis Fernando Bustos Ramírez on 15/03/24.
//

import OrderingEntities

extension BusinessResponseModel {
    
    func mapToBusiness() -> [Business] {
        
        return self.result.map{
            Business(id: $0.id, name: $0.name, slug: $0.slug, logo: $0.logo, open: $0.open)
        }
    }
}
