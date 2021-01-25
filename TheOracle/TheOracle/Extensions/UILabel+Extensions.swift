//
//  UILabel+Extensions.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 22/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

extension UILabel {
    
    func setAttributedText(_ text: String, strokeColor: UIColor = .white, foregroundColor: UIColor = .blue, strokeWidth: Float = -3, font: UIFont = UIFont(name: "DIN Condensed Bold", size: 72) ?? .boldSystemFont(ofSize: 52)) {
        attributedText = NSAttributedString(string: text, attributes: [
            NSAttributedString.Key.strokeColor: strokeColor,
            NSAttributedString.Key.foregroundColor: foregroundColor,
            NSAttributedString.Key.strokeWidth: strokeWidth,
            NSAttributedString.Key.font: font
        ])
    }
    
}
