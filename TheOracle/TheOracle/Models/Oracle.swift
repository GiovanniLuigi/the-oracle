//
//  Oracle.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 21/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import Foundation


struct Oracle: Codable {
    let title: String
    let coverImageURL: String
    let description: String
    let preparationDescription: String
    let backImageURL: String
    let oracleID: String
    let cardCount: Int
}
