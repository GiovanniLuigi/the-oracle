//
//  CardDetailViewModel.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 06/02/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import Foundation

protocol CardDetailViewDelegate {
    func viewModelDidFetchCardWithSuccess(card: OracleCard)
    func viewModelDidFetchCardWithError(error: Error)
}

struct CardDetailViewModel {
    let title: String = "The lion card"
    let shareBarButtonTitle: String = "Share"
    let saveBarButtonTitle: String = "Save"
    
    let backButtonTitle: String = "Back to home"
    let saveButtonTitle: String = "Save this message"
    
    let oracleID: Int
    let cardCount: Int
    let client: Network
    let viewDelegate: CardDetailViewDelegate
    
    init(oracleID: Int, cardCount: Int, viewDelegate: CardDetailViewDelegate) {
        self.oracleID = oracleID
        self.cardCount = cardCount
        self.viewDelegate = viewDelegate
        self.client = Network.shared
    }
    
    func loadCard() {
        let cardId = "\(oracleID)\(Int.random(in: 0..<cardCount))"
        client.getCard(id: cardId) { (result) in
            switch result {
            case .success(let card):
                viewDelegate.viewModelDidFetchCardWithSuccess(card: card)
            case .failure(let error):
                viewDelegate.viewModelDidFetchCardWithError(error: error)
            }
        }
    }
    
    func back() {
        print("back")
    }
    
    func save() {
        print("save")
    }
    
    func stop() {
        print("stop")
    }
}
