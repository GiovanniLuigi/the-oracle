//
//  OracleCellViewModel.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 28/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import Foundation


struct OracleCellViewModel {
    let title: String
    let imageURL: String
    let description: String
    private let startTooltip: (OracleCellViewModel) -> Void
    
    init(title: String, imageName: String, description: String, startTooltip: @escaping (OracleCellViewModel) -> Void) {
        self.title = title
        self.imageURL = imageName
        self.description = description
        self.startTooltip = startTooltip
    }
    
    func tapTooltip() {
        startTooltip(self)
    }
    
}
