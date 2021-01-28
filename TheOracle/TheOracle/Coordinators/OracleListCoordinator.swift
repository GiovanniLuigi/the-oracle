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
    
    func startOracleDetail() {
        let oracleDetailCoordinator = OracleDetailCoordinator()
        childCoordinators.append(oracleDetailCoordinator)
        oracleDetailCoordinator.start()
    }
}
