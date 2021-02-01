//
//  UIViewController+Extensions.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 27/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

extension UIViewController: Storyboarded {}


extension UIViewController {
    
    
    func presentAlert(title: String, message: String, okAction: (() -> Void)? = nil, cancelAction: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {
            _ in
            okAction?()
        })
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
            _ in
            cancelAction?()
        })
        
        present(alertController, animated: true, completion: nil)
    }
    
}
