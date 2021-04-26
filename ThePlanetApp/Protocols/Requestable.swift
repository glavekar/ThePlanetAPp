//
//  Requestable.swift
//  ThePlanetApp
//
//  Created by Girish Lavekar on 26/04/2021.
//

import Foundation

typealias RequestParameters = [String: Any]
typealias RequestHeaders = [String: String]

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
}

enum CacheExpiry {
    case never
    case aged(TimeInterval)
}

protocol Requestable {
    func asURLRequest() throws -> URLRequest
}

extension URLRequest: Requestable {
    
    func asURLRequest() throws -> URLRequest {
        return self
    }
}

protocol CacheRequestable: Requestable  {
    var expiry: CacheExpiry { get }
}

