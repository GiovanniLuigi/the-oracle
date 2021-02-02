//
//  OracleGameStepTwoViewModel.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 02/02/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import Foundation

struct OracleGameStepTwoViewModel {
    let alertMessage = "Leaving now would make you lose all your progress"
    let alertTitle = String.empty
    let backButtonTitle = "Quit"
    let coordinator: OracleGameStepTwoCoordinator
    
    func shouldBack() {
        coordinator.stop()
    }
}
