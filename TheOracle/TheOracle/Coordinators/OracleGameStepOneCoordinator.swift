//
//  OracleGameStepOneCoordinator.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 29/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

final class OracleGameStepOneCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let oracleGameStepOneViewController = OracleGameStepOneViewController.instantiate()
        let viewModel = OracleGameStepOneViewModel()
        oracleGameStepOneViewController.viewModel = viewModel
        
        navigationController.pushViewController(oracleGameStepOneViewController, animated: true)
    }
    
    
}
