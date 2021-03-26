//
//  OnboardingCoordinator.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 18/03/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

final class OnboardingCoordinator: Coordinator {
    private(set) var parent: Coordinator?
    private(set) var navigator: UIKitNavigator?
    var childCoordinators: [Coordinator] = []
    
    init(parent: Coordinator?, navigator: UIKitNavigator?) {
        self.parent = parent
        self.navigator = navigator
    }
    
    func start()  {
        let onboardingViewController = OnboardingViewController.instantiate()
        let viewModel = OnboardingViewModel(coordinator: self)
        onboardingViewController.viewModel = viewModel
        navigator?.set([onboardingViewController], animated: false)
    }
    
    func startOracleList() {
        let oracleListCoordinator = OracleListCoordinator(parent: self, navigator: navigator)
        oracleListCoordinator.start()
        stop()
    }
}

