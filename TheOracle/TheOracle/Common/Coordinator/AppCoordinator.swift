//
//  AppCoordinator.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 27/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit


final class AppCoordinator: Coordinator {
    private(set) var parent: Coordinator?
    private(set) var navigator: UIKitNavigator?
    var childCoordinators: [Coordinator] = []
    
    private let window: UIWindow
    private let navigationController: UINavigationController

    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        self.navigator = UIKitNavigator(navigationController: navigationController)
    }
    
    func start() {
        if DataSource.shared.checkAndMarkFirstOpen() {
            let oracleListCoordinator = OracleListCoordinator(parent: self, navigator: navigator)
            oracleListCoordinator.start()
            
            childCoordinators.append(oracleListCoordinator)
        } else {
            let onboardingCoordinator = OnboardingCoordinator(parent: self, navigator: navigator)
            onboardingCoordinator.start()
            
            childCoordinators.append(onboardingCoordinator)
        }
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
