//
//  BusinessModel.swift
//  OrderingTest
//
//  Created by Luis Fernando Bustos Ramírez on 15/03/24.
//

import Foundation
import OrderingEntities
import OrderingDomain
import OrderingDesignSystem

final class BusinessModel: ObservableObject {
    
    @Published var viewModel: BusinessViewModel
    private let dependencies: BusinessDependencies
    
    init(viewModel: BusinessViewModel, dependencies: BusinessDependencies) {
        self.viewModel = viewModel
        self.dependencies = dependencies
    }
    
    @MainActor
    func getBusinessList() {
        viewModel.isLoading = true
        dependencies.getBusinessUseCase.execute { result in
            DispatchQueue.main.async { [weak self] in
                self?.viewModel.isLoading = false
                switch result {
                case .success(let success):
                    self?.viewModel.businessList = success.map {
                        BusinessCellViewModel(id: $0.id, logo: $0.logo, background: $0.header, name: $0.name, schedule: $0.schedule)
                    }
                case .failure(let failure):
                    guard let self = self else {
                        return
                    }
                    self.viewModel.error = ErrorDetail(
                        title: "Error",
                        detail: failure.localizedDescription,
                        firstAction: .init(
                            title: "Try again",
                            action: {
                                self.viewModel.error = nil
                                self.getBusinessList()
                            }
                        )
                    )
                }
            }
        }
    }
}
