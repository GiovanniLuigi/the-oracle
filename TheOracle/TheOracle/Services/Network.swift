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
        case timeout
        
        var errorDescription: String? {
            return "Unable to retrive your data"
        }
    }
    
    private init() {
        Database.database().isPersistenceEnabled = false
        ref = Database.database().reference()
    }
    
    private func fetchWithTimeout(reference: DatabaseReference, completion: @escaping (Result<DataSnapshot, NetworkError>) -> Void) {
        var didComplete: Bool = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 30.0) {
            if !didComplete {
                didComplete = true
                DispatchQueue.main.async {
                    completion(.failure(.timeout))
                }
                return
            }
        }
        
        reference.observeSingleEvent(of: .value) { (snapshot) in
            if !didComplete {
                didComplete = true
                DispatchQueue.main.async {
                    completion(.success(snapshot))
                }
            }
        }
    }
    
    func getOracles(completion: @escaping (Result<[Oracle], NetworkError>) -> Void) {
        fetchWithTimeout(reference: oraclesRef) { (result) in
            switch result {
            case .success(let snapshot):
                if let oracles = snapshot.decode(type: [Oracle].self) {
                    completion(.success(oracles))
                } else {
                    completion(.failure(.genericError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    func getCard(id: String, completion: @escaping (Result<OracleCard, NetworkError>) -> Void) {
        fetchWithTimeout(reference: ref.child(id)) { (result) in
            switch result {
            case .success(let snapshot):
                if let card = snapshot.decode(type: OracleCard.self) {
                    completion(.success(card))
                } else {
                    completion(.failure(.genericError))
                }
            case .failure(let error):
                completion(.failure(error))
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
