//
//  OracleListViewController.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 27/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

class OracleListViewController: UIViewController {
    
    private let viewModel = OracleListViewModel()
    private var oracles: [Oracle] = []
    private var selectedIndex: Int?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Oracles"
//        navigationController?.navigationBar.prefersLargeTitles = true
        
        viewModel.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(OracleTableViewCell.nib, forCellReuseIdentifier: OracleTableViewCell.reuseIdentifier)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? OracleDetailModalViewController, let index = selectedIndex {
            let oracle = oracles[index]
            vc.cardTitle.text = oracle.title
            vc.cardDescription.text = oracle.rules
        }
    }
}


extension OracleListViewController: OracleListViewModelDelegate {
    func didFetch(oracles: [Oracle]) {
        self.oracles = oracles
        self.tableView.reloadData()
    }
    
    func failToFetchOracles() {
        print("Error to fetch oracles")
    }
}

extension OracleListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return oracles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: OracleTableViewCell.reuseIdentifier)  as? OracleTableViewCell {
            let oracle = oracles[indexPath.row]
            cell.title.setAttributedText(oracle.title, strokeColor: .white, foregroundColor: .black, strokeWidth: -3, font: UIFont(name: "DIN Condensed Bold", size: 72) ?? .boldSystemFont(ofSize: 52))
            cell.backgroundImage.setImage(from: oracle.imageUrl)
            cell.tooltipCompletion = { [weak self] in
                self?.selectedIndex = indexPath.row
                self?.performSegue(withIdentifier: "tooltip", sender: self)
            }
            
            return cell
        }
        return UITableViewCell()
    }
    
}

extension OracleListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 4
    }
}
