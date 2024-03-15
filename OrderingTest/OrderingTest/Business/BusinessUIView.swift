//
//  BusinessUIView.swift
//  OrderingTest
//
//  Created by Luis Fernando Bustos Ramírez on 15/03/24.
//

import SwiftUI

struct BusinessUIView: View {
    
    @ObservedObject var model: BusinessModel
    
    var body: some View {
        VStack {
            Text("Business list")
            List {
                ForEach(model.viewModel.businessList) { business in
                    Text(business.name)
                }
            }
            .refreshable {
                model.getBusinessList()
            }
            .overlay {
                if model.viewModel.businessList.isEmpty {
                    if #available(iOS 17.0, *) {
                        ContentUnavailableView {
                            Label("title", systemImage: "")
                        } description: {
                            Button {
                                model.getBusinessList()
                            } label: {
                                Text("description")
                            }
                        }
                    } else {
                        VStack {
                            Text("")
                                .padding()
                            Text("")
                                .padding()
                            Button {
                                model.getBusinessList()
                            } label: {
                                Text("description")
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    BusinessFactory.makeBusiness()
}
