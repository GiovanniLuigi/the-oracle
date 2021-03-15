//
//  CardDetailViewModel.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 06/02/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import Foundation


struct CardDetailViewModel {
    let title: String = "The lion card"
    let shareBarButtonTitle: String = "Share"
    let saveBarButtonTitle: String = "Save"
    
    let backButtonTitle: String = "Back to home"
    let saveButtonTitle: String = "Save this message"
    
    let oracleID: Int
    let cardCount: Int
    let client: Network

    init(oracleID: Int, cardCount: Int) {
        self.oracleID = oracleID
        self.cardCount = cardCount
        self.client = Network.shared
    }
    
    func load() {
        
    }
    
    func back() {
        print("back")
    }
    
    func save() {
        print("save")
    }
    
    func share() {
        print("share")
    }
    
}
