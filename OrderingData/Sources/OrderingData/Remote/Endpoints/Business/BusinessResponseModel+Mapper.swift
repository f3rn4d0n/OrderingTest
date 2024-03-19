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
            Business(id: $0.id, name: $0.name, slug: $0.slug, header: $0.header, logo: $0.logo, open: $0.open, todaySchedule: $0.today.mapToSchedule())
        }
    }
}

extension ScheduleResponseModel {
    func mapToSchedule() -> Schedule {
        
        let dailyLapses:[Lapses] = self.lapses.map {
            return $0.mapToLapses()
        }
        
        return Schedule(enabled: self.enabled, lapses: dailyLapses)
    }
}

extension LapsesResponseModel {
    
    func mapToLapses() -> Lapses {
        return Lapses(open: open.mapToTime(), close: close.mapToTime())
    }
}

extension LapsesTimeResponseModel {
    
    func mapToTime() -> LapsesTime {
        return LapsesTime(hour: self.hour, minute: self.minute)
    }
}
