//
//  PlanetListResponse.swift
//  ThePlanetApp
//
//  Created by Girish Lavekar on 26/04/2021.
//

import Foundation

struct PlanetListResponse: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case results
    }
    
    let planets: [Planet]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.planets = try container.decode([Planet].self, forKey: .results)
    }
}

struct Planet: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case title = "name"
    }
    
    let title: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
    }
}

