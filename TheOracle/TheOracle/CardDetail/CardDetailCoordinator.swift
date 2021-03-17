//
//  CardDetailCoordinator.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 06/02/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit


final class CardDetailCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    private let oracleID: Int
    private let cardCount: Int
    
    init(navigationController: UINavigationController, oracleID: Int, cardCount: Int) {
        self.navigationController = navigationController
        self.oracleID = oracleID
        self.cardCount = cardCount
    }
    
    func start() {
        let cardDetailViewController = CardDetailViewController.instantiate()
        cardDetailViewController.viewModel = CardDetailViewModel(oracleID: oracleID, cardCount: cardCount, viewDelegate: cardDetailViewController, delegate: self)
        navigationController.pushViewController(cardDetailViewController, animated: true)
    }
}


extension CardDetailCoordinator: CardDetailDelegate {
    func didStop() {
        navigationController.popViewController(animated: true)
    }
    
    func didStopGame() {
        navigationController.popToRootViewController(animated: true)
    }
}
