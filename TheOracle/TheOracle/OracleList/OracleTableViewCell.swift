//
//  OracleTableViewCell.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 21/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

class OracleTableViewCell: UITableViewCell {
    @IBOutlet weak var backgroundImage: UIImageView!
    
    private var viewModel: OracleCellViewModel?
    
    @IBAction func didTapTooltip(_ sender: Any) {
        viewModel?.tapTooltip()
    }
    
    func update(with viewModel: OracleCellViewModel) {
        self.viewModel = viewModel
        backgroundImage.setImage(from: viewModel.imageURL)
    }
    
}
