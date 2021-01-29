//
//  OracleListCoordinator.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 27/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit


final class OracleListCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let oracleListViewController = OracleListViewController.instantiate()
        oracleListViewController.viewModel = OracleListViewModel(coordinator: self)
        navigationController.setViewControllers([oracleListViewController], animated: false)
    }
    
    func startOracleDetail(viewModel: OracleCellViewModel) {
        let oracleDetailCoordinator = OracleDetailCoordinator(navigationController: navigationController, viewModel: viewModel, parentCoordinator: self)
        childCoordinators.append(oracleDetailCoordinator)
        oracleDetailCoordinator.start()
    }
    
    func startOracleGameStepOne() {
        let oracleGameStepOneCoordinator = OracleGameStepOneCoordinator(navigationController: navigationController)
        childCoordinators.append(oracleGameStepOneCoordinator)
        oracleGameStepOneCoordinator.start()
    }
    
    func didFinish(childCoordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
            return coordinator === childCoordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }
}
