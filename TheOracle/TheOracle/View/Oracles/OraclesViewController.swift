//
//  ViewController.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 18/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

class OraclesViewController: UIViewController {

    private let viewModel = OraclesViewModel()
    private var oracles: [Oracle] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(OracleTableViewCell.nib, forCellReuseIdentifier: OracleTableViewCell.reuseIdentifier)
    }
}


extension OraclesViewController: OraclesViewModelDelegate {
    func didFetch(oracles: [Oracle]) {
        self.oracles = oracles
        self.tableView.reloadData()
    }
    
    func failToFetchOracles() {
        print("Error to fetch oracles")
    }
    
    
}

extension OraclesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return oracles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: OracleTableViewCell.reuseIdentifier)  as? OracleTableViewCell {
            let oracle = oracles[indexPath.row]
            cell.title.setAttributedText(oracle.title, strokeColor: .white, foregroundColor: .black, strokeWidth: -3, font: UIFont(name: "DIN Condensed Bold", size: 72) ?? .boldSystemFont(ofSize: 52))
            cell.backgroundImage.setImage(from: oracle.imageUrl)
            return cell
        }
        return UITableViewCell()
    }
    
}

extension OraclesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 4
    }
}
