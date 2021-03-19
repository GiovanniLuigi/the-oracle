//
//  OnboardingPageViewController.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 19/03/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

class OnboardingPageViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    var labelText: String = "This is an text"
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = labelText
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
