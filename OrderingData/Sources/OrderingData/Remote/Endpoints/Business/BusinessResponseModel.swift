//
//  BusinessResponseModel.swift
//  
//
//  Created by Luis Fernando Bustos Ramírez on 15/03/24.
//

import Foundation

struct BusinessResponseModel: Decodable {
    let error: Bool
    let result: [BusinessDetailResponseModel]
}

struct BusinessDetailResponseModel: Decodable {
    let id: Int
    let name: String
    let slug: String
    let header: String?
    let logo: String?
    let open: Bool
    let schedule: [ScheduleResponseModel]
    let today: ScheduleResponseModel
}

struct ScheduleResponseModel: Decodable {
    
    let enabled: Bool
    let lapses : [LapsesResponseModel]
}

struct LapsesResponseModel: Decodable {
    let open: LapsesTimeResponseModel
    let close: LapsesTimeResponseModel
}

struct LapsesTimeResponseModel: Decodable {
    let hour: Int
    let minute: Int
}
