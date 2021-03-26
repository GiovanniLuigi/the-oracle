//
//  Coordinator.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 27/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import Foundation

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
    var parent: Coordinator? { get }
    var navigator: UIKitNavigator? { get }
    func start()
    func stop()
    func willStop()
    func didStop()
    func childDidStop(_ child: Coordinator)
    func dismiss()
}

extension Coordinator {
    func childDidStop(_ child: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
            return coordinator === child
        }) {
            childCoordinators.remove(at: index)
        }
    }
    
    func stop() {
        self.willStop()
        self.didStop()
    }
    
    func willStop() {
        self.navigator?.pop()
    }
    
    func didStop() {
        self.parent?.childDidStop(self)
    }
    
    func dismiss() {
        self.navigator?.dismiss()
    }
}

