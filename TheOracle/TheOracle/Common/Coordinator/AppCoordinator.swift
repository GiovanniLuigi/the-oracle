//
//  AppCoordinator.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 27/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit


final class AppCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        
        if DataSource.shared.checkAndMarkFirstOpen() {
            let oracleListCoordinator = OracleListCoordinator(navigationController: navigationController)
            oracleListCoordinator.start()
            
            childCoordinators.append(oracleListCoordinator)
        } else {
            let onboardingCoordinator = OnboardingCoordinator(navigationController: navigationController, parentCoordinator: self)
            onboardingCoordinator.start()
            
            childCoordinators.append(onboardingCoordinator)
        }
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func stop(_ childCoordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
            return coordinator === childCoordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }
}
