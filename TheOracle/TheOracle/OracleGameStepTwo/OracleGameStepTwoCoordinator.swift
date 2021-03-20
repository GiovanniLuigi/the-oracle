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
    private let oracleID: String
    private let cardCount: Int
    private let cardBackURL: String
    
    init(navigationController: UINavigationController, parentCoordinator: OracleGameStepOneCoordinator, oracleID: String, cardCount: Int, cardBackURL: String) {
        self.cardBackURL = cardBackURL
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
        self.cardCount = cardCount
        self.oracleID = oracleID
    }
    
    func start() {
        let oracleGameStepTwoViewController = OracleGameStepTwoViewController.instantiate()
        oracleGameStepTwoViewController.viewModel = OracleGameStepTwoViewModel(coordinator: self, oracleID: oracleID, cardCount: cardCount, cardBackURL: cardBackURL)
        navigationController.pushViewController(oracleGameStepTwoViewController, animated: true)
    }
    
    func startCardDetail(oracleID: String, cardCount: Int) {
        let cardDetailCoordinator = CardDetailCoordinator(navigationController: navigationController, oracleID: oracleID, cardCount: cardCount)
        childCoordinators.append(cardDetailCoordinator)
        cardDetailCoordinator.start()
    }
    
    func stop() {
        navigationController.popToRootViewController(animated: true)
        parentCoordinator.didFinish(childCoordinator: self)
    }
}

