//
//  RequestJSONEncoding.swift
//  ThePlanetApp
//
//  Created by Girish Lavekar on 26/04/2021.
//

import Foundation

struct RequestJSONEncoding: RequestEncoding {
    
    func encode(_ request: Requestable, with parameters: RequestParameters?) throws -> URLRequest {
        var urlRequest = try request.asURLRequest()
        guard let parameters = parameters else { return urlRequest }
        urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        return urlRequest
    }
}

