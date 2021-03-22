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
        } else {
            activityStartAnimating()
        }
        
        let imageCache = CacheManager.shared.imageCache
        
        if let cachedImage = imageCache.object(forKey: url as NSString) {
            image = cachedImage
            activityStopAnimating()
            return
        }
        
        let storage = Storage.storage()
        
        DispatchQueue.global().async { [weak self] in
            storage.reference(withPath: url).getData(maxSize: 1024*1000*500) { (data, error) in
                if error != nil {
                    return
                }
                
                if let data = data {
                    DispatchQueue.main.async {
                        if let newImage = UIImage(data: data) {
                            imageCache.setObject(newImage, forKey: url as NSString)
                            self?.image = newImage
                            self?.activityStopAnimating()
                        }
                    }
                }
            }
        }
        
    }
    
}


