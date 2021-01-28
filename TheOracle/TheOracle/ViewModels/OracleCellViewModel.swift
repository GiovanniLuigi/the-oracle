//
//  OracleCellViewModel.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 28/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import Foundation


final class OracleCellViewModel {
    let title: String
    let imageURL: String
    let description: String
    let coordinator: OracleListCoordinator
    
    init(title: String, imageName: String, description: String, coordinator: OracleListCoordinator) {
        self.coordinator = coordinator
        self.title = title
        self.imageURL = imageName
        self.description = description
    }
    
    func didTapCell() {
        
    }
    
    func didTapToolTip() {
        coordinator.startOracleDetail(viewModel: self)
    }
    
    func viewDidDisappear() {
        
    }
}
