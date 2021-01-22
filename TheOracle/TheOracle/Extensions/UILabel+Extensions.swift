//
//  UILabel+Extensions.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 22/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

extension UILabel {
    
    func setAttributedText(_ text: String, strokeColor: UIColor, foregroundColor: UIColor, strokeWidth: Float, font: UIFont) {
        attributedText = NSAttributedString(string: text, attributes: [
            NSAttributedString.Key.strokeColor: strokeColor,
            NSAttributedString.Key.foregroundColor: foregroundColor,
            NSAttributedString.Key.strokeWidth: strokeWidth,
            NSAttributedString.Key.font: font
        ])
    }
    
}
