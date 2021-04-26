//
//  CacheURLResponse+Decodable.swift
//  ThePlanetApp
//
//  Created by Girish Lavekar on 26/04/2021.
//

import Foundation

extension CachedURLResponse {
    
    func decoded<T: Decodable>(with decodableType: T.Type) throws -> T {
        try JSONDecoder().decode(T.self, from: self.data) as T
    }
}

