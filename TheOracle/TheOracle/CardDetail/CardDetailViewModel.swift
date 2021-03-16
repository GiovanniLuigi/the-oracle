//
//  CardDetailViewModel.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 06/02/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import Foundation
import CoreData

protocol CardDetailDelegate {
    func didStop()
}

protocol CardDetailViewDelegate {
    func viewModelDidFetchCardWithSuccess(card: OracleCard)
    func viewModelDidFetchCardWithError(error: Error)
}

final class CardDetailViewModel {
    let title: String = "The lion card"
    let shareBarButtonTitle: String = "Share"
    let saveBarButtonTitle: String = "Save"
    
    let backButtonTitle: String = "Back to home"
    let saveButtonTitle: String = "Save this message"
    
    let oracleID: Int
    let cardCount: Int
    let client: Network
    let viewDelegate: CardDetailViewDelegate
    let delegate: CardDetailDelegate
    let dataSource: DataSource
    var card: OracleCard?
    
    init(oracleID: Int, cardCount: Int, viewDelegate: CardDetailViewDelegate, delegate: CardDetailDelegate) {
        self.oracleID = oracleID
        self.cardCount = cardCount
        self.viewDelegate = viewDelegate
        self.client = Network.shared
        self.delegate = delegate
        self.dataSource = DataSource.shared
    }
    
    func loadCard() {
        let cardId = "\(oracleID)\(Int.random(in: 1...cardCount))"
        client.getCard(id: cardId) { [weak self] (result) in
            switch result {
            case .success(let card):
                self?.card = card
                self?.viewDelegate.viewModelDidFetchCardWithSuccess(card: card)
            case .failure(let error):
                self?.viewDelegate.viewModelDidFetchCardWithError(error: error)
            }
        }
    }
    
    func back() {
        print("back")
    }
    
    func save() {
        guard let card = self.card else {
            return
        }
        
        let fetchRequest: NSFetchRequest<CardEntity> = CardEntity.fetchRequest()
        let predicate = NSPredicate(format: "id = %@", card.id)
        fetchRequest.predicate = predicate
        
        let cardEntity = try? dataSource.viewContext.fetch(fetchRequest).first ?? CardEntity(context: dataSource.viewContext)
        cardEntity?.imageURL = card.imageURL
        cardEntity?.text = card.description
        cardEntity?.title = card.title
        
        dataSource.saveContext()
    }
    
    func stop() {
        delegate.didStop()
    }
}
