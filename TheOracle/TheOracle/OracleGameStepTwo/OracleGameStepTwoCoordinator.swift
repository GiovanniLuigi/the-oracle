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
    
    init(navigationController: UINavigationController, parentCoordinator: OracleGameStepOneCoordinator) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }
    
    func start() {
        let oracleGameStepTwoViewController = OracleGameStepTwoViewController.instantiate()
        oracleGameStepTwoViewController.viewModel = OracleGameStepTwoViewModel(coordinator: self)
        navigationController.pushViewController(oracleGameStepTwoViewController, animated: true)
    }
    
    func stop() {
        navigationController.popToRootViewController(animated: true)
        parentCoordinator.didFinish(childCoordinator: self)
    }
}

