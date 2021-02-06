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
    let title: String = "Oracle selection"
    
    private let cells = [OracleGameStepTwoCellViewModel]()
    
    //
    let coordinator: OracleGameStepTwoCoordinator
    let logoURL: String
    
    func shouldBack() {
        coordinator.stop()
    }
    
    func numOfItems(in section: Int) -> Int {
        return 6
    }
    
    func cellViewModel(at row: Int) -> OracleGameStepTwoCellViewModel {
        return OracleGameStepTwoCellViewModel(description: "Test", title: "Test", logoURL: logoURL)
    }
    
    func didSelectCard(at row: Int) {
        coordinator.startCardDetail()
    }
}
