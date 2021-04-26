//
//  PlanetListViewController.swift
//  ThePlanetApp
//
//  Created by Girish Lavekar on 26/04/2021.
//

import UIKit

final class PlanetListViewController: UIViewController {
    
    var planetListViewModel: PlanetListViewModelInterface?
    
    // Outlet for planet list table view
    @IBOutlet private weak var planetListView: UITableView! {
        didSet {
            self.planetListView.dataSource = self
            self.planetListView.delegate = self
            self.planetListView.register(UINib(nibName: PlanetListTableViewCell.nibName,
                                               bundle: nil),
                                         forCellReuseIdentifier: PlanetListTableViewCell.reuseIdentifier)
        }
    }
    
    // ViewController life cycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Planets"
        self.planetListViewModel?.fetchPlanets()
    }
}

extension PlanetListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.planetListViewModel?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = self.planetListViewModel,
              let cell = self.planetListView.dequeueReusableCell(withIdentifier: PlanetListTableViewCell.reuseIdentifier,
                                                                 for: indexPath) as? PlanetListTableViewCell
        else { return UITableViewCell() }
        cell.configure(with: viewModel.itemAtIndex(indexPath.row))
        return cell
    }
}

extension PlanetListViewController: UITableViewDelegate {
}

extension PlanetListViewController: PlanetListViewUpdater {
    
    func updateView() {
        self.planetListView.reloadData()
    }
    
    func onError() {
        
    }
}

extension PlanetListViewController: StoryboardInstantiable {}

