//
//  OracleGameStepOneCoordinator.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 29/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

final class OracleGameStepOneCoordinator: Coordinator {
    private(set) var parent: Coordinator?
    private(set) var navigator: UIKitNavigator?
    var childCoordinators: [Coordinator] = []
    
    private var viewModel: OracleGameStepOneViewModel

    init(parent: Coordinator?, navigator: UIKitNavigator?, viewModel: OracleGameStepOneViewModel) {
        self.parent = parent
        self.navigator = navigator
        self.viewModel = viewModel
    }
    
    func start() {
        let oracleGameStepOneViewController = OracleGameStepOneViewController.instantiate()
        viewModel.coordinator = self
        oracleGameStepOneViewController.viewModel = viewModel
        oracleGameStepOneViewController.coordinator = self
        
        navigator?.push(oracleGameStepOneViewController)
    }
    
    func startGameStepTwo(oracleID: String, cardCount: Int, cardBackURL: String) {
        let oracleGameStepTwoCoordinator = OracleGameStepTwoCoordinator(parent: self, navigator: navigator, oracleID: oracleID, cardCount: cardCount, cardBackURL: cardBackURL)
        childCoordinators.append(oracleGameStepTwoCoordinator)
        oracleGameStepTwoCoordinator.start()
    }

}
