//
//  CardDetailCoordinator.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 06/02/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit


final class CardDetailCoordinator: Coordinator {
    private(set) var parent: Coordinator?
    private(set) var navigator: UIKitNavigator?
    var childCoordinators: [Coordinator] = []
    
    private let oracleID: String
    private let cardCount: Int
    private let cardID: String?
    private let isFavorite: Bool
    
    init(oracleID: String, cardCount: Int, parent: Coordinator?, navigator: UIKitNavigator?, cardID: String? = nil, isFavorite: Bool = false) {
        self.oracleID = oracleID
        self.cardCount = cardCount
        self.parent = parent
        self.navigator = navigator
        self.cardID = cardID
        self.isFavorite = isFavorite
    }
    
    func start() {
        let cardDetailViewController = CardDetailViewController.instantiate()
        cardDetailViewController.viewModel = CardDetailViewModel(oracleID: oracleID, cardCount: cardCount, viewDelegate: cardDetailViewController, delegate: self, cardID: cardID, isFavorite: isFavorite)
        navigator?.push(cardDetailViewController)
    }
}

extension CardDetailCoordinator: CardDetailDelegate {
    func shouldStop() {
        self.stop()
    }
    
    func dismiss() {
        navigator?.dismiss()
    }
    
    func didGoToHome() {
        self.navigator?.popToRootView(animated: true)
        self.didStop()
    }
}
