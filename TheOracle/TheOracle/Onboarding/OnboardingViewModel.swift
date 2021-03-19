//
//  OnboardingViewModel.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 18/03/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import Foundation

final class OnboardingViewModel {
    
    private let coordinator: OnboardingCoordinator
    
    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
    }
    
    func close() {
        coordinator.startOracleList()
    }
    
}
