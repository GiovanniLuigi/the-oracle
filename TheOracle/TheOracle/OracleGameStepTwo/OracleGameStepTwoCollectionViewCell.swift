//
//  OracleGameStepTwoCollectionViewCell.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 03/02/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

class OracleGameStepTwoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var logoImageView: UIImageView!
    
    func update(with viewModel: OracleGameStepTwoCellViewModel) {
        logoImageView.setImage(from: viewModel.logoURL)
    }
    
}
