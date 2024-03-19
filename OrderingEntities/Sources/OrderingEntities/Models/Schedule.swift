//
//  Schedule.swift
//
//
//  Created by Luis Fernando Bustos Ramírez on 15/03/24.
//

import Foundation

public struct Schedule {
    public let enabled: Bool
    public let lapses : [Lapses]
    
    public init(enabled: Bool, lapses: [Lapses]) {
        self.enabled = enabled
        self.lapses = lapses
    }
}

public struct Lapses {
    
    public let open: LapsesTime
    public let close: LapsesTime
    
    public init(open: LapsesTime, close: LapsesTime) {
        self.open = open
        self.close = close
    }
}

public struct LapsesTime {
    
    public let hour: Int
    public let minute: Int
    
    public init(hour: Int, minute: Int) {
        self.hour = hour
        self.minute = minute
    }
}
