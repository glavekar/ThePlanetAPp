//
//  UIStoryboard+StoryboardAdditions.swift
//  ThePlanetApp
//
//  Created by Girish Lavekar on 26/04/2021.
//

import UIKit

extension UIStoryboard {
    
    enum NamedStoryboard: String {
        case main
        
        var fileName: String {
            return self.rawValue.capitalized
        }
    }
    
    convenience init(storyboardName: NamedStoryboard, bundle: Bundle? = nil) {
        self.init(name: storyboardName.fileName, bundle: bundle)
    }
    
    // Returns viewController with specific identifier from a storyboard
    func instantiateViewController<ViewController: UIViewController>() -> ViewController where ViewController: StoryboardInstantiable {
        guard let viewController = self.instantiateViewController(withIdentifier: ViewController.storyboardIdentifier) as? ViewController else {
            fatalError()
        }
        return viewController
    }
}
