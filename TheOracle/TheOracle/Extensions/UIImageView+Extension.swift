//
//  UIImage+Extension.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 22/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit
import FirebaseStorage

extension UIImageView {
    
    func setImage(from url: String, placeholder: UIImage? = nil) {
        if let placeholder = placeholder {
            image = placeholder
        }
        
        let storage = Storage.storage()
        
        DispatchQueue.global().async { [weak self] in
            storage.reference(withPath: url).getData(maxSize: 1024*1000*500) { (data, error) in
                if error != nil {
                    return
                }
                
                if let data = data {
                    DispatchQueue.main.async {
                        self?.image = UIImage(data: data)
                    }
                }
            }
        }
        
    }
    
}


