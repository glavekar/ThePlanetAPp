//
//  PlanetListRepositoryInterface.swift
//  ThePlanetApp
//
//  Created by Girish Lavekar on 26/04/2021.
//

import Foundation

protocol PlanetListRepositoryInterface {
    
    func fetchPlanets(completion: @escaping (Result<PlanetListResponse, Error>) -> Void)
}

final class PlanetListRepository: PlanetListRepositoryInterface {
    
    private let apiService: APIServiceInterface
    
    private let diskCache: URLCacheable
    
    init(with apiService: APIServiceInterface, diskCache: URLCacheable = DiskURLCache.default) {
        self.apiService = apiService
        self.diskCache = diskCache
    }
    
    /**
     This method is responsible for fetching response from cache or API service
     
     - parameters:
     - apiDetails: HTTP API details
     - completion: Completion handler closure with result
     
     - Returns:
     */
    func fetchPlanets(completion: @escaping (Result<PlanetListResponse, Error>) -> Void) {
        
        let request = Request(url: APIEndPoint.planetsAPI,
                              method: .get,
                              parameters: nil,
                              headers: nil,
                              encoding: GetRequestEncoding())
        let cacheableRequest = CacheableRequest(request: request,
                                                expiry: .aged(86400))
        
        self.apiService.request(for: request) {[weak self] (result: Result<APIHTTPDecodableResponse<PlanetListResponse>, Error>) in
            switch result {
            case .success(let response):
                completion(.success(response.decoded))
                self?.diskCache.store(response: response, forRequest: cacheableRequest, completion: nil)
            case .failure(let error):
                self?.handleFailureIfRequired(forRequest: cacheableRequest, error: error, completion: completion)
            }
        }
    }
    
    private func handleFailureIfRequired(forRequest request: CacheableRequest,
                                         error: Error,
                                         completion: @escaping (Result<PlanetListResponse, Error>) -> Void) {
        self.diskCache.get(forRequest: request) { (result: Result<APIHTTPDecodableResponse<PlanetListResponse>?, Error>) in
            switch result {
            case .success(let response):
                guard let response = response else {
                    completion(.failure(error))
                    return
                }
                completion(.success(response.decoded))
            case .failure:
                completion(.failure(error))
            }
        }
    }
}

