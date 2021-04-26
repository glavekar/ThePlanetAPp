//
//  PlanetListTableViewCell.swift
//  ThePlanetApp
//
//  Created by Girish Lavekar on 26/04/2021.
//

import UIKit

class PlanetListTableViewCell: UITableViewCell {
    
    // Mark: - Constants
    private enum Constants {
        static let titleLabelFont = UIFont(name: "HelveticaNeue-Regular", size: 16.0) ?? UIFont.systemFont(ofSize: 16.0)
    }
    
    // The title label
    private let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = Constants.titleLabelFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Mark: - Outlets
    @IBOutlet private weak var stackView: UIStackView! {
        didSet {
            self.stackView.addArrangedSubview(self.titleLabel)
        }
    }
    
    /**
     Configures cell with given `PlanetView` object.
     - parameter viewModel: instance of object conforming to `PlanetViewModelInterface`
     */
    func configure(with viewModel: PlanetViewModelInterface) {
        self.titleLabel.text = viewModel.title
    }
}

