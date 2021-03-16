//
//  OracleGameStepTwoCoordinator.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 02/02/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit


final class OracleGameStepTwoCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    private let parentCoordinator: OracleGameStepOneCoordinator
    private let logoURL: String
    private let oracleID: Int
    private let cardCount: Int
    
    init(navigationController: UINavigationController, parentCoordinator: OracleGameStepOneCoordinator, logoURL: String, oracleID: Int, cardCount: Int) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
        self.logoURL = logoURL
        self.cardCount = cardCount
        self.oracleID = oracleID
    }
    
    func start() {
        let oracleGameStepTwoViewController = OracleGameStepTwoViewController.instantiate()
        oracleGameStepTwoViewController.viewModel = OracleGameStepTwoViewModel(coordinator: self, logoURL: logoURL, oracleID: oracleID, cardCount: cardCount)
        navigationController.pushViewController(oracleGameStepTwoViewController, animated: true)
    }
    
    func startCardDetail(oracleID: Int, cardCount: Int) {
        let cardDetailCoordinator = CardDetailCoordinator(navigationController: navigationController, oracleID: oracleID, cardCount: cardCount)
        childCoordinators.append(cardDetailCoordinator)
        cardDetailCoordinator.start()
    }
    
    func stop() {
        navigationController.popToRootViewController(animated: true)
        parentCoordinator.didFinish(childCoordinator: self)
    }
}

