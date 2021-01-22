//
//  Network.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 18/01/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Network {
    
    static let shared = Network()
    
    let ref: DatabaseReference
    
    var oraclesRef: DatabaseReference {
        return ref.child("oracles")
    }
    
    enum NetworkError: Error, LocalizedError {
        case genericError
        
        var errorDescription: String? {
            return "Unable to retrive your data"
        }
    }
    
    private init() {
        Database.database().isPersistenceEnabled = true
        ref = Database.database().reference()
        
    }
    
    func observeOracles(completion: @escaping (Result<[Oracle], NetworkError>) -> Void) {
        oraclesRef.observe(.value) { (snapshot) in
            if let oracles = snapshot.decode(type: [Oracle].self) {
                DispatchQueue.main.async {
                    completion(.success(oracles))
                }
            } else {
                DispatchQueue.main.async {
                    completion(.failure(.genericError))
                }
            }
        }
    }
    
    
}


extension DataSnapshot {
    
    func decode<T: Decodable>(type: T.Type) -> T? {
        guard let value = value, let data = try? JSONSerialization.data(withJSONObject: value, options: .fragmentsAllowed) else {
            return nil
        }
        
        if let obj = try? JSONDecoder().decode(type, from: data) {
            return obj
        }
        
        return nil
    }
    
}
