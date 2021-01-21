//
//  ViewController.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 18/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

class OraclesViewController: UIViewController {

    let viewModel = OraclesViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        tableView.dataSource = self
        tableView.register(OracleTableViewCell.nib, forCellReuseIdentifier: OracleTableViewCell.reuseIdentifier)
        let n = Network.shared
    }
}


extension OraclesViewController: OraclesViewModelDelegate {
    
}

extension OraclesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: OracleTableViewCell.reuseIdentifier) {
            return cell
        }
        return UITableViewCell()
    }
    
    
}
