//
//  FavoritesViewModel.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 17/03/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import CoreData

protocol FavoritesViewDelegate: class {
    func didFetchCardsWithSuccess(_ viewModel: FavoritesViewModel)
    func didFetchCardsWithError(_ viewModel: FavoritesViewModel)
}

class FavoritesViewModel {
    private let dataSource: DataSource
    
    var cards: [CardEntity] = []
    var errorMessage: String = "An error ocurred"
    weak var viewDelegate: FavoritesViewDelegate?
    let coordinator: FavoritesCoordinator
    let title: String = "Favorites"
    
    init(viewDelegate: FavoritesViewDelegate, coordinator: FavoritesCoordinator) {
        self.viewDelegate = viewDelegate
        self.coordinator = coordinator
        dataSource = DataSource.shared
    }
    
    func load() {
        let request: NSFetchRequest<CardEntity> = CardEntity.fetchRequest()
        do {
            let cards = try dataSource.viewContext.fetch(request)
            if cards.isEmpty {
                errorMessage = "No favorites found"
                viewDelegate?.didFetchCardsWithError(self)
                return
            }
            
            self.cards = cards
            viewDelegate?.didFetchCardsWithSuccess(self)
        } catch {
            viewDelegate?.didFetchCardsWithError(self)
            return
        }
    }
    
    func selectRowAt(row: Int) {
        let card = cards[row]
        coordinator.startCardDetail(card: card)
    }
    
    func stop() {
        coordinator.stop()
    }
    
    func dismiss() {
        coordinator.dismiss()
    }
    
}
