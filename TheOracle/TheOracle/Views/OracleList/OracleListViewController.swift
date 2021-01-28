//
//  OracleListViewController.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 27/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

class OracleListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: OracleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        
        viewModel.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(OracleTableViewCell.nib, forCellReuseIdentifier: OracleTableViewCell.reuseIdentifier)
    }
    
}


extension OracleListViewController: OracleListViewModelDelegate {
    
    func didFetchFetchOracles() {
        tableView.reloadData()
    }
    
    func failToFetchOracles() {
        print("Error to fetch oracles")
    }
}

extension OracleListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: OracleTableViewCell.reuseIdentifier)  as? OracleTableViewCell {
            let cellViewModel = viewModel.cellViewModel(for: indexPath.row)
            cell.update(with: cellViewModel)
            return cell
        }
        return UITableViewCell()
    }
    
}

extension OracleListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        print("sdas")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 4
    }
}
