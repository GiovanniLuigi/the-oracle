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
        
        let oracleListCoordinator = OracleListCoordinator(navigationController: navigationController)
        oracleListCoordinator.start()
        
        childCoordinators.append(oracleListCoordinator)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
