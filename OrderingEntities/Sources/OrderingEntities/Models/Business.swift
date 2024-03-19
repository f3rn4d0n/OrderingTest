//
//  Business.swift
//  OrderingEntities
//
//  Created by Luis Fernando Bustos Ramírez on 15/03/24.
//

import Foundation

public struct Business {
    
    public let id: Int
    public let name: String
    public let slug: String
    public let header: String?
    public let logo: String?
    public let open: Bool
    public let todaySchedule: Schedule
    
    public init(id: Int, name: String, slug: String, header: String?, logo: String?, open: Bool, todaySchedule: Schedule) {
        self.id = id
        self.name = name
        self.slug = slug
        self.header = header
        self.logo = logo
        self.open = open
        self.todaySchedule = todaySchedule
    }
}
