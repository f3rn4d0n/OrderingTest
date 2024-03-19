//
//  BusinessViewModel.swift
//  OrderingTest
//
//  Created by Luis Fernando Bustos Ramírez on 15/03/24.
//

import Foundation
import OrderingDesignSystem

struct BusinessViewModel {
    var businessList: [BusinessCellViewModel]
    var error: ErrorDetail?
    var isLoading: Bool
}

struct BusinessCellViewModel: Identifiable, Hashable {
    let id: Int
    let logo: String?
    let background: String?
    let name: String
    let schedule: String
}
