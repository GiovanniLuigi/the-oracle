//
//  OracleDetailCoordinator.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 28/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

final class OracleDetailCoordinator: Coordinator {
    private(set) var parent: Coordinator?
    private(set) var navigator: UIKitNavigator?
    private let viewModel: OracleCellViewModel
    var childCoordinators: [Coordinator] = []
    
    init(parent: Coordinator?, navigator: UIKitNavigator?, viewModel: OracleCellViewModel) {
        self.parent = parent
        self.navigator = navigator
        self.viewModel = viewModel
    }
    
    func start() {
        let oracleDetailViewController = OracleDetailViewController.instantiate()
        oracleDetailViewController.viewModel = OracleDetailViewModel(coordinator: self, title: viewModel.title, description: viewModel.description)
        oracleDetailViewController.modalPresentationStyle = .overCurrentContext
        navigator?.present(oracleDetailViewController)
    }

    func willStop() {
        navigator?.dismiss()
    }
}

