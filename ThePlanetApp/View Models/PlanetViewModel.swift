//
//  PlanetViewModel.swift
//  ThePlanetApp
//
//  Created by Girish Lavekar on 26/04/2021.
//

import Foundation

protocol PlanetViewModelInterface {
    var title: String { get }
}

final class PlanetViewModel: PlanetViewModelInterface {
    
    let planet: Planet
    let title: String
    
    init(planet: Planet) {
        self.planet = planet
        self.title = planet.title
    }
}
