//
//  UITableViewCell+ReuseIdentifier.swift
//  ThePlanetApp
//
//  Created by Girish Lavekar on 26/04/2021.
//

import Foundation

import UIKit

protocol ReuseIdentifier {
    static var reuseIdentifier: String { get }
}

protocol NibLoadable {
    static var nibName: String { get }
}

extension NibLoadable where Self: UITableViewCell {
    
    static var nibName: String {
        return String(describing: self)
    }
}

extension ReuseIdentifier where Self: UITableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReuseIdentifier {}
extension UITableViewCell: NibLoadable {}

