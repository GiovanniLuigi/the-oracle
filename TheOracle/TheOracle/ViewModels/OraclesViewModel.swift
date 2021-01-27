//
//  OraclesViewModel.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 21/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import Foundation

protocol OracleListViewModelDelegate {
    func didFetch(oracles: [Oracle])
    func failToFetchOracles()
}


class OracleListViewModel {
    private var network = Network.shared
    var delegate: OracleListViewModelDelegate?
    
    init() {
        network.observeOracles { [weak self] (result) in
            switch result {
            case .success(let oracles):
                self?.delegate?.didFetch(oracles: oracles)
            case .failure:
                self?.delegate?.failToFetchOracles()
            }
        }
    }
}
