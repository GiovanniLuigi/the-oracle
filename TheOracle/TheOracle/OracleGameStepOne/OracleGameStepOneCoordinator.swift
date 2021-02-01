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
    private var viewModel: OracleGameStepOneViewModel
    private weak var parentCoordinator: OracleListCoordinator?
    
    init(navigationController: UINavigationController, viewModel: OracleGameStepOneViewModel, parentCoordinator: OracleListCoordinator) {
        self.navigationController = navigationController
        self.viewModel = viewModel
        self.parentCoordinator = parentCoordinator
    }
    
    func start() {
        let oracleGameStepOneViewController = OracleGameStepOneViewController.instantiate()
        viewModel.coordinator = self
        oracleGameStepOneViewController.viewModel = viewModel
        
        navigationController.pushViewController(oracleGameStepOneViewController, animated: true)
    }
    
    func stop() {
        navigationController.popViewController(animated: true)
        parentCoordinator?.didFinish(childCoordinator: self)
    }

}
