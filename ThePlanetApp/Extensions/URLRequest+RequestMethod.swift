//
//  URLRequest+RequestMethod.swift
//  ThePlanetApp
//
//  Created by Girish Lavekar on 26/04/2021.
//

import Foundation

extension URLRequest {
    
    var requestMethod: RequestMethod? {
        guard let httpMethod = self.httpMethod else { return nil }
        return RequestMethod(rawValue: httpMethod)
    }
    
    init(with url: URLFormable, method: RequestMethod, headers: [String: String]?) throws {
        self.init(url: try url.asURL())
        self.httpMethod = method.rawValue
        self.allHTTPHeaderFields = headers
    }
}

