//
//  OracleGameStepOneViewController.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 29/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

class OracleGameStepOneViewController: UIViewController {

    deinit {
        print("deinit OnboardingViewController")
    }
    
    var viewModel: OracleGameStepOneViewModel!
    var coordinator: OracleGameStepOneCoordinator!
    
    @IBOutlet weak var oracleImageView: UIImageView!
    @IBOutlet weak var preparationDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        oracleImageView.image = UIImage(named: "ball")
        
        UIView.animate(withDuration: 3.0, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.oracleImageView.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        })
        
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
        viewModel.startStepTwo()
    }

}
