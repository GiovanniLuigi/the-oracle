//
//  OnboardingViewController.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 18/03/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

class OnboardingViewController: UIPageViewController {
    
    @IBOutlet weak var pageControl: UIPageControl!
    var viewModel: OnboardingViewModel!
    var pages: [OnboardingPageViewController] = []
    var currentIndex: Int = 0
    
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
        title = "The Oracle"
        let skipBarButton = UIBarButtonItem(title: "Skip", style: UIBarButtonItem.Style.plain, target: self, action: #selector(didTapSkip))
        navigationItem.rightBarButtonItem = skipBarButton

        self.dataSource = self
        let firstPage = OnboardingPageViewController.instantiate()
        firstPage.labelText = "Welcome! This is an Oracle card deck collection! Here you have opportunity to discover a new path"
        firstPage.index = 0

        let secondPage = OnboardingPageViewController.instantiate()
        secondPage.labelText = "To play choose one deck and meditate about something that concers you, make a question. The Oracle will answer"
        secondPage.index = 1
        
        let thirdPage = OnboardingPageViewController.instantiate()
        thirdPage.labelText = "Are you ready to start your journey?"
        thirdPage.index = 2
        thirdPage.didTapContinueClosure = {
            self.close()
        }
        
        pages = [firstPage, secondPage, thirdPage]
        setViewControllers([pages[0]], direction: .forward, animated: true, completion: nil)
    }
    
    @objc func didTapSkip() {
        self.close()
    }
    
    func close() {
        viewModel.close()
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
    
    private func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = .lightGray
        appearance.currentPageIndicatorTintColor = .orange
        appearance.backgroundColor = .clear
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        setupPageControl()
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
