//
//  APIServiceInterface.swift
//  ThePlanetApp
//
//  Created by Girish Lavekar on 26/04/2021.
//

import Foundation

protocol APIServiceInterface {
    func request<T: Decodable>(for request: Requestable, completion: @escaping (Result<APIHTTPDecodableResponse<T>, Error>) -> Void)
    func request(for request: Requestable, completion: @escaping (Result<APIHTTPDataResponse, Error>) -> Void)
}

