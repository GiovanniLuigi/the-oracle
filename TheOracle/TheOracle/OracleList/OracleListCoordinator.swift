//
//  OracleListCoordinator.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 27/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit


final class OracleListCoordinator: Coordinator {
    private(set) var parent: Coordinator?
    private(set) var navigator: UIKitNavigator?
    
    var childCoordinators: [Coordinator] = []
    
    init(parent: Coordinator?, navigator: UIKitNavigator?) {
        self.parent = parent
        self.navigator = navigator
    }
    
    func start() {
        let oracleListViewController = OracleListViewController.instantiate()
        oracleListViewController.viewModel = OracleListViewModel(coordinator: self)
        navigator?.set([oracleListViewController], animated: false)
    }
    
    func startOracleDetail(viewModel: OracleCellViewModel) {
        let oracleDetailCoordinator = OracleDetailCoordinator(parent: self, navigator: navigator, viewModel: viewModel)
        childCoordinators.append(oracleDetailCoordinator)
        oracleDetailCoordinator.start()
    }
    
    func startOracleGameStepOne(viewModel: OracleGameStepOneViewModel) {
        let oracleGameStepOneCoordinator = OracleGameStepOneCoordinator(parent: self, navigator: navigator, viewModel: viewModel)
        childCoordinators.append(oracleGameStepOneCoordinator)
        oracleGameStepOneCoordinator.start()
    }
    
    func startFavorites() {
        let favoritesCoordinator = FavoritesCoordinator(parent: self, navigator: navigator)
        childCoordinators.append(favoritesCoordinator)
        favoritesCoordinator.start()
    }
    
}
