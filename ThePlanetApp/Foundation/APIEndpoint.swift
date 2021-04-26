//
//  APIEndpoint.swift
//  ThePlanetApp
//
//  Created by Girish Lavekar on 26/04/2021.
//

import Foundation

enum APIEndPoint: String, URLFormable {
    case planetsAPI = "https://swapi.dev/api/planets/"
    
    func asURL() throws -> URL {
        try self.rawValue.asURL()
    }
}

