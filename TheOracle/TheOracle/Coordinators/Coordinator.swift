//
//  Coordinator.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 27/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import Foundation

protocol Coordinator {
    var childCoordinators: [Coordinator] {get}
    func start()
}
