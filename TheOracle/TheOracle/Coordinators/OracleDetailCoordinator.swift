//
//  OracleDetailCoordinator.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 28/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

final class OracleDetailCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let parentCoordinator: OracleListCoordinator!
    let navigationController: UINavigationController
    let viewModel: OracleCellViewModel
    
    init(navigationController: UINavigationController, viewModel: OracleCellViewModel, parentCoordinator: OracleListCoordinator) {
        self.navigationController = navigationController
        self.viewModel = viewModel
        self.parentCoordinator = parentCoordinator
    }
    
    func start() {
        let oracleDetailViewController = OracleDetailViewController.instantiate()
        oracleDetailViewController.viewModel = viewModel
        oracleDetailViewController.modalPresentationStyle = .overCurrentContext
        navigationController.present(oracleDetailViewController, animated: true, completion: nil)
    }
    
    func stop() {
        parentCoordinator.didFinish(childCoordinator: self)
    }
    
    deinit {
        print("deinit detail coordinator")
    }
}

