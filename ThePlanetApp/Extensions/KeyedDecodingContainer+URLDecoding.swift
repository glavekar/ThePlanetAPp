//
//  KeyedDecodingContainer+URLDecoding.swift
//  ThePlanetApp
//
//  Created by Girish Lavekar on 26/04/2021.
//

import Foundation

extension KeyedDecodingContainerProtocol {
    
    /**
     Decodes to given codable structure
     - returns: url
     */
    func decodeURLByAddingPercentEncoding(_ type: URL.Type, forKey key: Self.Key) throws -> URL {
        var urlString = try self.decode(String.self, forKey: key)
        urlString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? urlString
        guard let url = URL(string: urlString) else {
            throw DecodingError.dataCorruptedError(forKey: key, in: self, debugDescription: "URL can't be formed after adding percent encoding")
        }
        return url
    }
}
