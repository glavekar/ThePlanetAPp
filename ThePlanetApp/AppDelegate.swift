//
//  AppDelegate.swift
//  ThePlanetApp
//
//  Created by Girish Lavekar on 26/04/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let rootViewController: PlanetListViewController = UIStoryboard(storyboardName: .main)
            .instantiateViewController()
        let viewModel = PlanetListViewModel(with: PlanetListRepository(with: APIService()))
        rootViewController.planetListViewModel = viewModel
        viewModel.delegate = rootViewController
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: rootViewController)
        self.window?.makeKeyAndVisible()
        return true
    }
}
