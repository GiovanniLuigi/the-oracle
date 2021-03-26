//
//  CacheManager.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 19/03/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit


final class CacheManager {
    static let shared: CacheManager = CacheManager()
    let imageCache = NSCache<NSString, UIImage>()
    
    private init() {}
}
