//
//  Schedule.swift
//
//
//  Created by Luis Fernando Bustos Ramírez on 15/03/24.
//

import Foundation

struct Schedule {
    
    let enabled: Bool
    let lapses : [Lapses]
}

struct Lapses {
    let open: LapsesTime
    let close: LapsesTime
}

struct LapsesTime {
    let hour: Int
    let minute: Int
}
