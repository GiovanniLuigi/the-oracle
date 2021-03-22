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
        
        view.activityStartAnimating()
        title = viewModel.title
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        viewModel.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(OracleTableViewCell.nib, forCellReuseIdentifier: OracleTableViewCell.reuseIdentifier)
        
        let favoritesBarButton = UIBarButtonItem(title: "Favorites", style: UIBarButtonItem.Style.plain, target: self, action: #selector(didTapFavorites))
        
        navigationItem.rightBarButtonItems = [favoritesBarButton]
    }
    
    @objc
    private func didTapFavorites() {
        viewModel.startFavorites()
    }
    
}

extension OracleListViewController: OracleListViewModelDelegate {
    
    func didFetchFetchOracles() {
        tableView.reloadData()
        view.activityStopAnimating()
    }
    
    func failToFetchOracles() {
        view.activityStopAnimating()
        presentAlert(title: "Error", message: "Fail to fetch decks", okAction:  {
            self.dismiss(animated: true, completion: nil)
        })
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
        viewModel.didTapCell(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 4
    }
}
