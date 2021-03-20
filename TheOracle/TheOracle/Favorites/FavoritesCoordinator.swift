//
//  File.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 17/03/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

final class FavoritesCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let favoritesViewController = FavoritesViewController.instantiate()
        let viewModel = FavoritesViewModel(viewDelegate: favoritesViewController, coordinator: self)
        favoritesViewController.viewModel = viewModel
        
        navigationController.pushViewController(favoritesViewController, animated: true)
    }
  
    func startCardDetail(card: CardEntity) {
        let cardDetailViewController = CardDetailViewController.instantiate()
        let viewModel = CardDetailViewModel(oracleID: "", cardCount: -1, viewDelegate: cardDetailViewController, delegate: self)
        viewModel.isFavorite = true
        viewModel.cardID = card.id ?? ""
        
        cardDetailViewController.viewModel = viewModel
        navigationController.pushViewController(cardDetailViewController, animated: true)
    }
    
    func stop() {
        navigationController.popViewController(animated: true)
    }
}

extension FavoritesCoordinator: CardDetailDelegate {
    func didStop() {
        stop()
    }
    
    func didStopGame() {
        stop()
    }
}
