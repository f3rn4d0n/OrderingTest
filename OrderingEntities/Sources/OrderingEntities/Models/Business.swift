//
//  Business.swift
//  OrderingEntities
//
//  Created by Luis Fernando Bustos Ramírez on 15/03/24.
//

import Foundation

public struct Business {
    
    let id: Int
    let name: String
    let slug: String
    let logo: String
    let open: Bool
    let todaySchedule: Schedule?
    
    public init(id: Int, name: String, slug: String, logo: String, open: Bool, todaySchedule: Schedule? = nil) {
        self.id = id
        self.name = name
        self.slug = slug
        self.logo = logo
        self.open = open
        self.todaySchedule = todaySchedule
    }
}
