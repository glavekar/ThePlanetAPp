//
//  StoryboardInstantiable.swift
//  ThePlanetApp
//
//  Created by Girish Lavekar on 26/04/2021.
//

import UIKit

protocol StoryboardInstantiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardInstantiable where Self: UIViewController {
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}

