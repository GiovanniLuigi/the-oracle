//
//  OracleDetailModalViewController.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 25/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

class OracleDetailModalViewController: UIViewController {
    @IBOutlet weak var modalCard: UIView!
    @IBOutlet weak var cardTitle: UILabel!
    @IBOutlet weak var cardDescription: UILabel!
    
    private let blurEffectView = UIVisualEffectView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        view.addGestureRecognizer(tapGesture)
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
