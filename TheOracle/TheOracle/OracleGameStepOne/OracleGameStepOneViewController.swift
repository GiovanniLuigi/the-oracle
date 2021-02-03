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
    var coordinator: OracleGameStepOneCoordinator!
    
    @IBOutlet weak var oracleImageView: UIImageView!
    @IBOutlet weak var preparationDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        oracleImageView.setImage(from: viewModel.cardLogoURL)
        preparationDescription.text = viewModel.preparationDescription
        
        let newBackButton = UIBarButtonItem(title: viewModel.backButtonTitle, style: UIBarButtonItem.Style.plain, target: self, action: #selector(didTapLeaveGame))
        navigationItem.leftBarButtonItem = newBackButton
    }
 
    @objc func didTapLeaveGame() {
        presentAlert(title: viewModel.alertTitle, message: viewModel.alertMessage, okAction: { [weak self] in
            self?.viewModel.shouldBack()
        })
    }
    
    @IBAction func didTapStart(_ sender: Any) {
        coordinator.startGameStepTwo(logoURL: viewModel.cardLogoURL)
    }

}
