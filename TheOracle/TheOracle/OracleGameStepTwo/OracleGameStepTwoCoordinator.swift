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
    
    init(navigationController: UINavigationController, parentCoordinator: OracleGameStepOneCoordinator, logoURL: String) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
        self.logoURL = logoURL
    }
    
    func start() {
        let oracleGameStepTwoViewController = OracleGameStepTwoViewController.instantiate()
        oracleGameStepTwoViewController.viewModel = OracleGameStepTwoViewModel(coordinator: self, logoURL: logoURL)
        navigationController.pushViewController(oracleGameStepTwoViewController, animated: true)
    }
    
    func startCardDetail() {
        let cardDetailCoordinator = CardDetailCoordinator(navigationController: navigationController)
        childCoordinators.append(cardDetailCoordinator)
        cardDetailCoordinator.start()
    }
    
    func stop() {
        navigationController.popToRootViewController(animated: true)
        parentCoordinator.didFinish(childCoordinator: self)
    }
}

