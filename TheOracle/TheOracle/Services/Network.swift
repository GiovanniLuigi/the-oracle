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
    
    static let shared: Network = Network()
    
    private let ref: DatabaseReference
    
    private var oraclesRef: DatabaseReference {
        return ref.child("oracles")
    }
    
    enum NetworkError: Error, LocalizedError {
        case genericError
        
        var errorDescription: String? {
            return "Unable to retrive your data"
        }
    }
    
    private init() {
        Database.database().isPersistenceEnabled = false
        ref = Database.database().reference()
        
    }
    
    func observeOracles(completion: @escaping (Result<[Oracle], NetworkError>) -> Void) {
        oraclesRef.observeSingleEvent(of: .value) { (snapshot) in
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
    
    func getCard(id: String, completion: @escaping (Result<OracleCard, NetworkError>) -> Void) {
        ref.child(id).observeSingleEvent(of: .value) { (snapshot) in
            if let card = snapshot.decode(type: OracleCard.self) {
                DispatchQueue.main.async {
                    completion(.success(card))
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
