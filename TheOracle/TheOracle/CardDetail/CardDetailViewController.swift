//
//  CardDetailViewController.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 06/02/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

class CardDetailViewController: UIViewController {
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var cardDescriptionLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    var viewModel: CardDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        let saveBarButton = UIBarButtonItem(title: viewModel.saveBarButtonTitle, style: UIBarButtonItem.Style.plain, target: self, action: #selector(save))
        let shareBarButton = UIBarButtonItem(title: viewModel.shareBarButtonTitle, style: UIBarButtonItem.Style.plain, target: self, action: #selector(share))
        
        navigationItem.rightBarButtonItems = [shareBarButton, saveBarButton]
        
        self.saveButton.setTitle(viewModel.saveButtonTitle, for: .normal)
        self.backButton.setTitle(viewModel.backButtonTitle, for: .normal)
    }

    @IBAction func back(_ sender: Any) {
        print("back")
    }
    
    @objc
    @IBAction func save(_ sender: Any) {
        print("save")
    }
    
    @objc
    func share() {
        print("share")
    }
    
}
