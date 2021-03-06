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
        
    let coordinator: OracleGameStepTwoCoordinator
    let oracleID: String
    let cardCount: Int
    let cardBackURL: String
    
    func shouldBack() {
        coordinator.stop()
    }
    
    func numberOfItems(in section: Int) -> Int {
        return cardCount
    }
    
    func cellViewModel(at row: Int) -> OracleGameStepTwoCellViewModel {
        return OracleGameStepTwoCellViewModel(cardBackURL: cardBackURL)
    }
    
    func didSelectCard(at row: Int) {
        coordinator.startCardDetail(oracleID: oracleID, cardCount: cardCount)
    }
}
