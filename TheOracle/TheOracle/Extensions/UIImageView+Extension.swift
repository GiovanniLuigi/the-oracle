//
//  UIImage+Extension.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 22/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func setImage(from url: String, placeholder: UIImage? = nil) {
        if let placeholder = placeholder {
            image = placeholder
        }
        
        guard let url = URL(string: url) else {
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self?.image = UIImage(data: data)
                }
            }
        }
    }
    
}


