//
//  OracleDetailModalViewController.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 25/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

class OracleDetailViewController: UIViewController {
    @IBOutlet weak var modalCard: CardView!
    @IBOutlet weak var cardTitle: UILabel!
    @IBOutlet weak var cardDescription: UILabel!
    
    var viewModel : OracleCellViewModel!
    
    private let blurEffectView = UIVisualEffectView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        view.addGestureRecognizer(tapGesture)
        
        cardTitle.text = viewModel.title
        cardDescription.text = viewModel.description
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        blurEffectView.effect = nil
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        view.bringSubviewToFront(modalCard)
        
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.blurEffectView.effect = UIBlurEffect(style: .extraLight)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
    }

    @objc private func didTapView(_ sender: UITapGestureRecognizer) {
        guard sender.state == .ended else {return}
        UIView.animate(withDuration: 0.1) { [weak self] in
            self?.blurEffectView.effect = nil
        } completion: { [weak self] (_) in
            guard let s = self else {return}
            let location = sender.location(in: s.view)
            if !s.modalCard.frame.contains(location) {
                s.dismiss(animated: true, completion: nil)
            }
        }
    }
}
