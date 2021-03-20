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
    @IBOutlet weak var cardBackgroundView: UIView!
    
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        cardBackgroundView.clipsToBounds = true
        cardBackgroundView.layer.cornerRadius = 20
    }
    
    func update(with viewModel: OracleGameStepTwoCellViewModel) {
        logoImageView.setImage(from: viewModel.cardBackURL)
    }
    
}
