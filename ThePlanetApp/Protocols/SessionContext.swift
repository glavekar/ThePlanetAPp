//
//  SessionContext.swift
//  ThePlanetApp
//
//  Created by Girish Lavekar on 26/04/2021.
//

import Foundation

protocol SessionContext {
    var session: URLSession { get }
}

final class DataSessionContext: SessionContext {
    
    static let commonContext = DataSessionContext(session: .shared)
    
    let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
}

