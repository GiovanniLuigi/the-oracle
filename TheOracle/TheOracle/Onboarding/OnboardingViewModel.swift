//
//  OnboardingViewModel.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 18/03/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import Foundation

protocol OnboardingViewDelegate {
    
}

final class OnboardingViewModel {
    
    let viewDelegate: OnboardingViewDelegate
    
    init(viewDelegate: OnboardingViewDelegate) {
        self.viewDelegate = viewDelegate
    }
    
    
}
