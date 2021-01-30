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
    private let viewModel: OracleGameStepOneViewModel
    
    init(navigationController: UINavigationController, viewModel: OracleGameStepOneViewModel) {
        self.navigationController = navigationController
        self.viewModel = viewModel
    }
    
    func start() {
        let oracleGameStepOneViewController = OracleGameStepOneViewController.instantiate()
        oracleGameStepOneViewController.viewModel = viewModel
        
        navigationController.pushViewController(oracleGameStepOneViewController, animated: true)
    }
    
    
}
