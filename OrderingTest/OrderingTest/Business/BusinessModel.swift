//
//  BusinessModel.swift
//  OrderingTest
//
//  Created by Luis Fernando Bustos Ramírez on 15/03/24.
//

import Foundation
import OrderingEntities
import OrderingDomain

final class BusinessModel: ObservableObject {
    
    @Published var viewModel: BusinessViewModel
    private let dependencies: BusinessDependencies
    
    init(viewModel: BusinessViewModel, dependencies: BusinessDependencies) {
        self.viewModel = viewModel
        self.dependencies = dependencies
    }
    
    func getBusinessList() {
        dependencies.getBusinessUseCase.execute { result in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case .success(let success):
                    self?.viewModel.businessList = success.map {  
                        BusinessCellViewModel(id: $0.id, logo: $0.logo, background: $0.header, name: $0.name, schedule: $0.schedule)
                    }
                case .failure(let failure):
                    print("error: \(failure)")
                }
            }
        }
    }
}
