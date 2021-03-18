//
//  CardEntity+Extensions.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 17/03/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import CoreData

extension CardEntity {
    
    class func fetchRequestById(_ id: String) -> NSFetchRequest<CardEntity> {
        let fetchRequest: NSFetchRequest<CardEntity> = CardEntity.fetchRequest()
        let predicate = NSPredicate(format: "id = %@", id)
        fetchRequest.predicate = predicate
        
        return fetchRequest
    }
    
}
