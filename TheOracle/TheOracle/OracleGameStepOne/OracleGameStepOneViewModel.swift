//
//  OracleGameStepOneViewModel.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 29/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit


final class OracleGameStepOneViewModel {
    
    let preparationDescription: String
    let title: String
    let cardCount: Int
    let oracleID: String
    
    let alertMessage = "Leaving now would make you lose all your progress"
    let alertTitle = String.empty
    let backButtonTitle = "Quit"
    let cardBackURL: String
    
    weak var coordinator: OracleGameStepOneCoordinator?
    
    init(preparationDescription: String, title: String, cardCount: Int, oracleID: String, cardBackURL: String) {
        self.cardBackURL = cardBackURL
        self.preparationDescription = preparationDescription
        self.title = title
        self.cardCount = cardCount
        self.oracleID = oracleID
    }
    
    func shouldBack() {
        coordinator?.stop()
    }

    func startStepTwo() {
        coordinator?.startGameStepTwo(oracleID: oracleID, cardCount: cardCount, cardBackURL: cardBackURL)
    }
}
