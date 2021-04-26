//
//  PlanetListViewModel.swift
//  ThePlanetApp
//
//  Created by Girish Lavekar on 26/04/2021.
//

import Foundation

protocol PlanetListViewModelInterface {
    var numberOfRows: Int { get }
    func itemAtIndex(_ index: Int) -> PlanetViewModelInterface
    func fetchPlanets()
}


protocol PlanetListViewUpdater: class {
    func updateView()
    func onError()
}

final class PlanetListViewModel: PlanetListViewModelInterface {
    
    private let repository: PlanetListRepositoryInterface
    
    private var planetViewModels: [PlanetViewModel] = []
    
    weak var delegate: PlanetListViewUpdater?
    
    init(with repository: PlanetListRepositoryInterface) {
        self.repository = repository
    }
    
    // Calls to get the planet list
    func fetchPlanets() {
        self.repository.fetchPlanets { [weak self] result in
            switch result {
            case .success(let response):
                self?.dispatchResponse(response)
            case .failure(let error):
                self?.dispatchError(error)
            }
        }
    }
    
    var numberOfRows: Int {
        return self.planetViewModels.count
    }
    
    func itemAtIndex(_ index: Int) -> PlanetViewModelInterface {
        return self.planetViewModels[index]
    }
    
    private func dispatchResponse(_ response: PlanetListResponse) {
        DispatchQueue.main.async {
            self.planetViewModels = response.planets.map({ PlanetViewModel(planet: $0) })
            self.delegate?.updateView()
        }
    }
    
    private func dispatchError(_ error: Error) {
        DispatchQueue.main.async {
            self.delegate?.onError()
        }
    }
}

