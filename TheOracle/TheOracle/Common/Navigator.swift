//
//  Navigation.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 24/03/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

protocol Navigator {
    associatedtype View

    func present(_ view: View, animated: Bool, completion: (() -> Void)?)
    func push(_ view: View, animated: Bool)
    func set(_ views: [View], animated: Bool)
    func popToRootView(animated: Bool)
    func pop(animated: Bool)
    func dismiss(animated: Bool, completion: (() -> Void)?)
}

class UIKitNavigator: Navigator {
    typealias View = UIViewController
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func present(_ view: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        self.navigationController.present(view, animated: animated, completion: completion)
    }
    
    func push(_ view: UIViewController, animated: Bool = true) {
        self.navigationController.pushViewController(view, animated: animated)
    }
    
    func set(_ views: [UIViewController], animated: Bool) {
        self.navigationController.setViewControllers(views, animated: animated)
    }
    
    func popToRootView(animated: Bool = true) {
        self.navigationController.popToRootViewController(animated: true)
    }
    
    func pop(animated: Bool = true) {
        self.navigationController.popViewController(animated: animated)
    }
    
    func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        self.navigationController.dismiss(animated: animated, completion: completion)
    }
}
