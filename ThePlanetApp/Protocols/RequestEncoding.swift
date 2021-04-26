//
//  RequestEncoding.swift
//  ThePlanetApp
//
//  Created by Girish Lavekar on 26/04/2021.
//

import Foundation

protocol RequestEncoding {
    func encode(_ request: Requestable, with parameters: RequestParameters?) throws -> URLRequest
}

struct GetRequestEncoding: RequestEncoding {
    
    func encode(_ request: Requestable, with parameters: RequestParameters?) throws -> URLRequest {
        return try RequestURLEncoding().encode(request, with: parameters)
    }
}

struct PostRequestEncoding: RequestEncoding {
    
    func encode(_ request: Requestable, with parameters: RequestParameters?) throws -> URLRequest {
        return try RequestJSONEncoding().encode(request, with: parameters)
    }
}

