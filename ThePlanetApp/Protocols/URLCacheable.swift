//
//  URLCacheable.swift
//  ThePlanetApp
//
//  Created by Girish Lavekar on 26/04/2021.
//

import Foundation

typealias URLCacheableStoreCompletion = (Result<Bool, Error>) -> ()

protocol URLCacheable {
    func store(response: APIHTTPDataResponse, forRequest request: CacheRequestable, completion: URLCacheableStoreCompletion?)
    func store<T: Decodable>(response: APIHTTPDecodableResponse<T>, forRequest request: CacheRequestable, completion: URLCacheableStoreCompletion?)
    func get<T: Decodable>(forRequest request: Requestable, completion: @escaping (Result<APIHTTPDecodableResponse<T>?, Error>) -> Void)
    func get(forRequest request: Requestable, completion: @escaping (Result<APIHTTPDataResponse?, Error>) -> Void)
    func remove(forRequest request: Requestable, completion: URLCacheableStoreCompletion?)
}

