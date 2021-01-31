//
//  OracleTableViewCell.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 21/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

class OracleTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    private var viewModel: OracleCellViewModel?
    
    @IBAction func didTapTooltip(_ sender: Any) {
        viewModel?.tapTooltip()
    }
    
    func update(with viewModel: OracleCellViewModel) {
        self.viewModel = viewModel
        title.setAttributedText(viewModel.title, strokeColor: .white, foregroundColor: .black, strokeWidth: -3, font: UIFont(name: "DIN Condensed Bold", size: 72) ?? .boldSystemFont(ofSize: 52))
        backgroundImage.setImage(from: viewModel.imageURL)
    }
    
}
