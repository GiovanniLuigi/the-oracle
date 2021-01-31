//
//  OracleGameStepOneViewController.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 29/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

class OracleGameStepOneViewController: UIViewController {

    var viewModel: OracleGameStepOneViewModel!
    @IBOutlet weak var oracleImageView: UIImageView!
    @IBOutlet weak var preparationDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        oracleImageView.setImage(from: viewModel.cardLogoURL)
        preparationDescription.text = viewModel.preparationDescription
    }
    
    @IBAction func didTapStart(_ sender: Any) {
        print("Start")
    }
    
}
