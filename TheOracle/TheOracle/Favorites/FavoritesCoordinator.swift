//
//  File.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 17/03/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

final class FavoritesCoordinator: Coordinator {
    private(set) var parent: Coordinator?
    private(set) var navigator: UIKitNavigator?
    var childCoordinators: [Coordinator] = []
    
    init(parent: Coordinator?, navigator: UIKitNavigator?) {
        self.parent = parent
        self.navigator = navigator
    }
    
    func start()  {
        let favoritesViewController = FavoritesViewController.instantiate()
        let viewModel = FavoritesViewModel(viewDelegate: favoritesViewController, coordinator: self)
        favoritesViewController.viewModel = viewModel
        
        navigator?.push(favoritesViewController)
    }
  
    func startCardDetail(card: CardEntity) {
        let oracleCardDetailCoordinator = CardDetailCoordinator(oracleID: "", cardCount: -1, parent: self, navigator: navigator, cardID: card.id, isFavorite: true)
        oracleCardDetailCoordinator.start()
        
        childCoordinators.append(oracleCardDetailCoordinator)
//
//        let cardDetailViewController = CardDetailViewController.instantiate()
//        let viewModel = CardDetailViewModel(oracleID: "", cardCount: -1, viewDelegate: cardDetailViewController, delegate: self)
//        viewModel.isFavorite = true
//        viewModel.cardID = card.id ?? ""
//
//        cardDetailViewController.viewModel = viewModel
//        navigator?.push(cardDetailViewController)
    }
}
