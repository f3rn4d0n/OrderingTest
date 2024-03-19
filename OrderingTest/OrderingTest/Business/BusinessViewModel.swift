//
//  BusinessViewModel.swift
//  OrderingTest
//
//  Created by Luis Fernando Bustos Ramírez on 15/03/24.
//

import Foundation

struct BusinessViewModel {
    var businessList: [BusinessCellViewModel]
}

struct BusinessCellViewModel: Identifiable, Hashable {
    let id: Int
    let logo: String?
    let background: String?
    let name: String
    let schedule: String
}
