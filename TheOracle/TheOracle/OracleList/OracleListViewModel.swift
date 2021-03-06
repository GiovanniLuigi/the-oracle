//
//  OraclesViewModel.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 21/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import Foundation

protocol OracleListViewModelDelegate {
    func didFetchFetchOracles()
    func failToFetchOracles()
}


final class OracleListViewModel {
    private var network = Network.shared
    private var oracles = [Oracle]()
    
    var delegate: OracleListViewModelDelegate?
    
    var numberOfRows: Int {
        oracles.count
    }
    let coordinator: OracleListCoordinator
    let title: String = "Oracle decks"
    
    init(coordinator: OracleListCoordinator) {
        self.coordinator = coordinator
        network.getOracles { [weak self] (result) in
            switch result {
            case .success(let oracles):
                self?.oracles = oracles
                self?.delegate?.didFetchFetchOracles()
            case .failure:
                self?.delegate?.failToFetchOracles()
            }
        }
    }
    
    func cellViewModel(for row: Int) -> OracleCellViewModel {
        let oracle = oracles[row]
        return OracleCellViewModel(title: oracle.title, imageName: oracle.coverImageURL, description: oracle.description, startTooltip: startTooltop)
    }
    
    private func startTooltop(viewModel: OracleCellViewModel) {
        coordinator.startOracleDetail(viewModel: viewModel)
    }
    
    func didTapCell(at row: Int) {
        let oracle = oracles[row]
        coordinator.startOracleGameStepOne(viewModel: OracleGameStepOneViewModel(preparationDescription: oracle.preparationDescription, title: oracle.title, cardCount: oracle.cardCount, oracleID: oracle.oracleID, cardBackURL: oracle.backImageURL))
    }
    
    func startFavorites() {
        coordinator.startFavorites()
    }
    
}
