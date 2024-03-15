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
}
