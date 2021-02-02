//
//  OracleGameStepTwoViewController.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 02/02/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

class OracleGameStepTwoViewController: UIViewController {

    var viewModel: OracleGameStepTwoViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newBackButton = UIBarButtonItem(title: viewModel.backButtonTitle, style: UIBarButtonItem.Style.plain, target: self, action: #selector(didTapLeaveGame))
        navigationItem.leftBarButtonItem = newBackButton
    }
 
    @objc func didTapLeaveGame() {
        presentAlert(title: viewModel.alertTitle, message: viewModel.alertMessage, okAction: { [weak self] in
            self?.viewModel.shouldBack()
        })
    }

}
