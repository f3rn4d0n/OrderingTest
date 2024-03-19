//
//  BusinessUIView.swift
//  OrderingTest
//
//  Created by Luis Fernando Bustos Ramírez on 15/03/24.
//

import SwiftUI
import OrderingDesignSystem

struct BusinessUIView: View {
    
    @ObservedObject var model: BusinessModel
    
    var body: some View {
        ZStack {
            VStack {
                Text("Business list")
                    .font(.title)
                    .padding()
                List {
                    ForEach(model.viewModel.businessList) { business in
                        OrderingCell(
                            title: business.name,
                            detail: business.schedule,
                            backgroundImage: business.background,
                            imageURL: business.logo
                        )
                    }
                }
                .refreshable {
                    model.getBusinessList()
                }
                .overlay {
                    if model.viewModel.businessList.isEmpty {
                        ContentUnavailable(
                            title: "Business not found",
                            systemImage: "eyeglasses",
                            actionMessage: "Try again") {
                                model.getBusinessList()
                            }
                            .onAppear {
                                Task {
                                    model.getBusinessList()
                                }
                            }
                    }
                }
            }
            if let error = model.viewModel.error {
                ErrorAlert(error: error)
            }
        }
    }
}

#Preview {
    BusinessFactory.makeBusiness()
}
