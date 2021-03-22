//
//  FavoritesViewController.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 17/03/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    var viewModel: FavoritesViewModel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        tableView.register(FavoritesTableViewCell.nib, forCellReuseIdentifier: FavoritesTableViewCell.reuseIdentifier)
        view.activityStartAnimating()
        viewModel.load()
    }
}

extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.selectRowAt(row: indexPath.row)
    }
}

extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesTableViewCell.reuseIdentifier) as? FavoritesTableViewCell else {
            return UITableViewCell()
        }
        let title = viewModel.cards[indexPath.row].title
        cell.titleLabel.text = title
        return cell
    }
}

extension FavoritesViewController: FavoritesViewDelegate {
    func didFetchCardsWithSuccess(_ viewModel: FavoritesViewModel) {
        view.activityStopAnimating()
        if viewModel.cards.isEmpty {
            presentAlert(title: "Attention", message: "You do not have any favorites yet", okAction: {
                self.dismiss(animated: true, completion: nil)
                viewModel.stop()
            })
        } else {
            tableView.reloadData()
        }
    }
    
    func didFetchCardsWithError(_ viewModel: FavoritesViewModel) {
        view.activityStopAnimating()
        presentAlert(title: "Error", message: viewModel.errorMessage, okAction: {
            self.dismiss(animated: true, completion: nil)
            viewModel.stop()
        })
    }
}
