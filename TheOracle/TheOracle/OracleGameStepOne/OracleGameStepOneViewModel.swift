//
//  OracleGameStepOneViewModel.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 29/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit


final class OracleGameStepOneViewModel {
    let cardLogoURL: String
    let preparationDescription: String
    let title: String
    let cardCount: Int
    let oracleID: Int
    
    let alertMessage = "Leaving now would make you lose all your progress"
    let alertTitle = String.empty
    let backButtonTitle = "Quit"
    
    weak var coordinator: OracleGameStepOneCoordinator?
    
    init(cardLogoURL: String, preparationDescription: String, title: String, cardCount: Int, oracleID: Int) {
        self.cardLogoURL = cardLogoURL
        self.preparationDescription = preparationDescription
        self.title = title
        self.cardCount = cardCount
        self.oracleID = oracleID
    }
    
    func shouldBack() {
        coordinator?.stop()
    }

    func startStepTwo() {
        coordinator?.startGameStepTwo(logoURL: cardLogoURL, oracleID: oracleID, cardCount: cardCount)
    }
}
