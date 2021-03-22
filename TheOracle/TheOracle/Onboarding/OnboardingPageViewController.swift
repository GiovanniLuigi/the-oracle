//
//  OnboardingPageViewController.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 19/03/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

class OnboardingPageViewController: UIViewController {
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var label: UILabel!
    var labelText: String = "This is an text"
    var index: Int = 0
    var didTapContinueClosure: (()->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = labelText
        
        if didTapContinueClosure == nil {
            continueButton.isHidden = true
        }
    }

    @IBAction func didTapContinue(_ sender: Any) {
        didTapContinueClosure?()
    }
}
