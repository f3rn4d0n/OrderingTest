//
//  File.swift
//  
//
//  Created by Luis Fernando Bustos Ramírez on 15/03/24.
//

import Foundation

extension BusinessResponseModel {
    
    func mapToBusiness() -> Business {
        
        return Business(
            id: self.id,
            name: self.name,
            slug: self.slug,
            logo: self.logo,
            open: self.open,
            todaySchedule: self.schedule.first
        )
    }
}
