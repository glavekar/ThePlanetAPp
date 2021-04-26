//
//  APIServiceError.swift
//  ThePlanetApp
//
//  Created by Girish Lavekar on 26/04/2021.
//

enum APIServiceError: Error {
    
    enum URLFormableError: Error {
        case failed
    }
    
    enum URLEncodingErrorReason {
        case invalidURL
    }
    
    enum URLEncodingError: Error {
        case failed(URLEncodingErrorReason)
    }
    
    enum APIResponseErrorReason: Error {
        case httpStatusCodeFailure
    }
    
    enum APIResponseError: Error {
        case failed(APIResponseErrorReason)
    }
    
    enum CacheableRequestError: Error {
        case invalidMethod
    }
}
