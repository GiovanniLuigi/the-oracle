//
//  UITableViewCell+Extensions.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 21/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit


extension UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
}


extension UIView {
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: frame.size)
        return renderer.image { context in
            layer.render(in: context.cgContext)
        }
    }
}

protocol LoadableView where Self: UIView {
    var activityView: UIView? { get set }
    func activityStartAnimating(activityColor: UIColor, backgroundColor: UIColor)
    func activityStopAnimating()
}

extension LoadableView {
    
    var activityView: UIView? {
        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return UIView._activityComputedProperty[tmpAddress] ?? nil
        }
        set(newValue) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            UIView._activityComputedProperty[tmpAddress] = newValue
        }
    }
    
    
    func activityStartAnimating(activityColor: UIColor = .orange, backgroundColor: UIColor = .clear) {
        let backgroundView = UIView()
        backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        backgroundView.backgroundColor = backgroundColor
        
        var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 75, height: 75))        
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.large
        activityIndicator.color = activityColor
        activityIndicator.startAnimating()
        self.isUserInteractionEnabled = false
        
        backgroundView.addSubview(activityIndicator)
        activityView = backgroundView
        self.addSubview(backgroundView)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.heightAnchor.constraint(equalToConstant: 75).isActive = true
        activityIndicator.widthAnchor.constraint(equalToConstant: 75).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    func activityStopAnimating() {
        if let background = activityView {
            background.removeFromSuperview()
        }
        self.isUserInteractionEnabled = true
    }
}

extension UIView: LoadableView {
    fileprivate static var _activityComputedProperty = [String: UIView]()
}
