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
    
    func start() {
        
    }
    
    func startOracleDetail() {
        let oracleDetailCoordinator = OracleDetailCoordinator()
        childCoordinators.append(oracleDetailCoordinator)
        oracleDetailCoordinator.start()
    }
}

