//
//  BusinessFactory.swift
//  OrderingTest
//
//  Created by Luis Fernando Bustos Ramírez on 15/03/24.
//

import SwiftUI
import OrderingDomain

struct BusinessFactory {

    static func makeBusiness() -> some View {

        let dependencies = BusinessDependencies(
            getBusinessUseCase: GetBusinessUseCase()
        )
        
        let viewModel = BusinessModel(
            viewModel: .init(businessList: []),
            dependencies: dependencies
        )

        return BusinessUIView(model: viewModel)
    }
}
