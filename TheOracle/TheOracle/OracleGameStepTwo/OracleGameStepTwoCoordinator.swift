//
//  OracleGameStepTwoCoordinator.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 02/02/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit


final class OracleGameStepTwoCoordinator: Coordinator {
    private(set) var parent: Coordinator?
    private(set) var navigator: UIKitNavigator?
    var childCoordinators: [Coordinator] = []
    private let oracleID: String
    private let cardCount: Int
    private let cardBackURL: String
    
    init(parent: Coordinator?, navigator: UIKitNavigator?, oracleID: String, cardCount: Int, cardBackURL: String) {
        self.cardBackURL = cardBackURL
        self.parent = parent
        self.navigator = navigator
        self.cardCount = cardCount
        self.oracleID = oracleID
    }
    
    func start() {
        let oracleGameStepTwoViewController = OracleGameStepTwoViewController.instantiate()
        oracleGameStepTwoViewController.viewModel = OracleGameStepTwoViewModel(coordinator: self, oracleID: oracleID, cardCount: cardCount, cardBackURL: cardBackURL)
        navigator?.push(oracleGameStepTwoViewController)
    }
    
    func startCardDetail(oracleID: String, cardCount: Int) {
        let cardDetailCoordinator = CardDetailCoordinator(oracleID: oracleID, cardCount: cardCount, parent: self, navigator: navigator)
        childCoordinators.append(cardDetailCoordinator)
        cardDetailCoordinator.start()
    }
    
    func willStop() {
        navigator?.popToRootView()
    }
}

