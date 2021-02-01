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
    
    let alertMessage = "Leaving now would make you lose all your progress"
    let alertTitle = String.empty
    let backButtonTitle = "Quit"
    
    weak var coordinator: OracleGameStepOneCoordinator?
    
    init(cardLogoURL: String, preparationDescription: String, title: String) {
        self.cardLogoURL = cardLogoURL
        self.preparationDescription = preparationDescription
        self.title = title
    }
    
    func shouldBack() {
        coordinator?.stop()
    }

}
