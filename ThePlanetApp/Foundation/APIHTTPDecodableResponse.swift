//
//  APIHTTPDecodableResponse.swift
//  ThePlanetApp
//
//  Created by Girish Lavekar on 26/04/2021.
//

import Foundation

struct APIHTTPDataResponse {
    let data: Data
    let httpResponse: HTTPURLResponse?
}

struct APIHTTPDecodableResponse<T> where T:Decodable {
    let data: Data
    let decoded: T
    let httpResponse: HTTPURLResponse?
}
