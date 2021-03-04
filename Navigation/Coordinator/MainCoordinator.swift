//
//  MainCoordinator.swift
//  Navigation
//
//  Created by Sergey on 11.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController
    
    let tabbar = TabBarController()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
        navigationController.navigationBar.isHidden = true
        navigationController.pushViewController(tabbar, animated: true)
        
        let feedNavigation = UINavigationController()
        feedNavigation.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "house.fill"), tag: 0)
        let feedFlowCoordinator = FeedFlowCoordinator(navigationController: feedNavigation)
        
        let profileNavigation = UINavigationController()
        profileNavigation.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 0)
        let profileFlowCoordinator = ProfileFlowCoordinator(navigationController: profileNavigation)
        
        childCoordinator = [feedFlowCoordinator, profileFlowCoordinator]
        feedFlowCoordinator.start()
        profileFlowCoordinator.start()
        
        tabbar.viewControllers = [feedNavigation, profileNavigation]
    }
}

