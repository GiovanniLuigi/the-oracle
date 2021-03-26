//
//  OracleDetailViewModel.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 29/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import Foundation


struct OracleDetailViewModel {
    
    let title: String
    let description: String
    private let coordinator: OracleDetailCoordinator
    
    init(coordinator: OracleDetailCoordinator, title: String, description: String) {
        self.coordinator = coordinator
        self.title = title
        self.description = description
    }
    
    func shouldStop() {
        coordinator.stop()
    }

}
