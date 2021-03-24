//
//  OnboardingCoordinator.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 18/03/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

final class OnboardingCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    private weak var parentCoordinator: AppCoordinator?
    
    init(navigationController: UINavigationController, parentCoordinator: AppCoordinator) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }
    
    func start() {
        let onboardingViewController = OnboardingViewController.instantiate()
        let viewModel = OnboardingViewModel(coordinator: self)
        onboardingViewController.viewModel = viewModel
        navigationController.setViewControllers([onboardingViewController], animated: false)
    }
    
    func startOracleList() {
        let oracleListCoordinator = OracleListCoordinator(navigationController: navigationController)
        oracleListCoordinator.start()
        parentCoordinator?.stop(self)
    }
}

