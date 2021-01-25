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
    var tooltipCompletion: (() -> Void)?
    
    @IBAction func didTapTooltip(_ sender: Any) {
        tooltipCompletion?()
    }
    
}
