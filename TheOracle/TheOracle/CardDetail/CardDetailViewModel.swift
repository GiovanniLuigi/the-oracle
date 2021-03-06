//
//  CardDetailViewModel.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 06/02/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import Foundation
import CoreData

protocol CardDetailDelegate: class {
    func shouldStop()
    func dismiss()
    func didGoToHome()
}

protocol CardDetailViewDelegate: class {
    func viewModelDidFetchCardWithSuccess(card: OracleCard)
    func viewModelDidFetchCardWithError(error: Error)
}

final class CardDetailViewModel {
    let title: String = ""
    let shareBarButtonTitle: String = "Share"
    let saveBarButtonTitle: String = "Save"
    
    let backButtonTitle: String = "Back to home"
    let saveButtonTitle: String = "Save this message"
    
    let oracleID: String
    let cardCount: Int
    let client: Network
    weak var viewDelegate: CardDetailViewDelegate?
    weak var delegate: CardDetailDelegate?
    let dataSource: DataSource
    var card: OracleCard?
    var cardID: String?
    var isFavorite: Bool
    
    init(oracleID: String, cardCount: Int, viewDelegate: CardDetailViewDelegate, delegate: CardDetailDelegate, cardID: String?, isFavorite: Bool) {
        self.oracleID = oracleID
        self.cardCount = cardCount
        self.viewDelegate = viewDelegate
        self.client = Network.shared
        self.delegate = delegate
        self.dataSource = DataSource.shared
        self.isFavorite = isFavorite
        self.cardID = cardID
    }
    
    func loadCard() {
        if let cardID = self.cardID {
            let fetchRequest: NSFetchRequest<CardEntity> = CardEntity.fetchRequestById(cardID)
            guard let card = try? dataSource.viewContext.fetch(fetchRequest).first else {
                return
            }
            
            self.card = OracleCard(cid: cardID, title: card.title ?? "", description: card.text ?? "", imageURL: card.imageURL ?? "")
            self.viewDelegate?.viewModelDidFetchCardWithSuccess(card: self.card!)
        } else {
            let cardId = "\(oracleID)\(Int.random(in: 1...cardCount))"
            client.getCard(id: cardId) { [weak self] (result) in
                switch result {
                case .success(let card):
                    self?.card = card
                    self?.viewDelegate?.viewModelDidFetchCardWithSuccess(card: card)
                case .failure(let error):
                    self?.viewDelegate?.viewModelDidFetchCardWithError(error: error)
                }
            }
        }
    }
    
    func back() {
        delegate?.didGoToHome()
    }
    
    func dismiss() {
        delegate?.dismiss()
    }
    
    func save() {
        guard let card = self.card else {
            return
        }
        
        let fetchRequest: NSFetchRequest<CardEntity> = CardEntity.fetchRequestById(card.cid)
        
        let cards = try? dataSource.viewContext.fetch(fetchRequest)
        
        if let cardEntity = cards?.first {
            cardEntity.id = card.cid
            cardEntity.imageURL = card.imageURL
            cardEntity.text = card.description
            cardEntity.title = card.title
        } else {
            let cardEntity = CardEntity(context: dataSource.viewContext)
            cardEntity.id = card.cid
            cardEntity.imageURL = card.imageURL
            cardEntity.text = card.description
            cardEntity.title = card.title
        }
        
        dataSource.saveContext()
    }
    
    func stop() {
        delegate?.shouldStop()
    }
}
