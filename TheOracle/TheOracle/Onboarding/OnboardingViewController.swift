//
//  OnboardingViewController.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 18/03/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

class OnboardingViewController: UIPageViewController {

    var viewModel: OnboardingViewModel!
    var pages: [OnboardingPageViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setup()
    }

    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup() {
        self.dataSource = self
        let firstPage = OnboardingPageViewController.instantiate()
        firstPage.labelText = "First page [1]"
        firstPage.index = 0
        
        let secondPage = OnboardingPageViewController.instantiate()
        secondPage.labelText = "Second page [2]"
        secondPage.index = 1
        
        let thirdPage = OnboardingPageViewController.instantiate()
        thirdPage.labelText = "Third page [3]"
        thirdPage.index = 2
        
        pages = [firstPage, secondPage, thirdPage]
        setViewControllers([pages[0]], direction: .forward, animated: true, completion: nil)
    }

}

extension OnboardingViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let page = viewController as? OnboardingPageViewController else {
            return nil
        }
        
        let index = page.index
        return index < pages.count - 1 ? pages[index + 1] : nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let page = viewController as? OnboardingPageViewController else {
            return nil
        }
        
        let index = page.index
        return index > 0 ? pages[index - 1] : nil
    }
    
}

extension OnboardingViewController: OnboardingViewDelegate {
    
}
