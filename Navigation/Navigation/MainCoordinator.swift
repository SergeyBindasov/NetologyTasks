//
//  MainCoordinator.swift
//  Navigation
//
//  Created by Sergey on 05.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit

final class MainCoordinator: Coordinator {
    var coordinators: [Coordinator] = []
    
    
    var navigationController: UINavigationController
    
    let tabbar = TabBarController()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
   
    
    func start() {
        
        navigationController.pushViewController(tabbar, animated: true)
        
        let feedNavigation = UINavigationController()
        feedNavigation.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "house.fill"), tag: 0)
        let feedFlowCoordinator = FeedFlowCoordinator(navigationController: feedNavigation)
        
        let profileNavigition = UINavigationController()
        profileNavigition.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 0)
        profileNavigition.navigationBar.isHidden = true
        let profileFlowCoordinator = ProfileFlowCoordinator(navigationController: profileNavigition)
        
        let favoriteNavigation = UINavigationController()
        favoriteNavigation.navigationBar.prefersLargeTitles = true
        favoriteNavigation.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(systemName: "heart.fill"), tag: 0)
        let favoriteFlowCoordinator = FavoriteFlowCoordinator(navigationController: favoriteNavigation)
        
        
        
        coordinators = [feedFlowCoordinator, profileFlowCoordinator, favoriteFlowCoordinator]
        tabbar.navigationController?.navigationBar.isHidden = true
        tabbar.viewControllers = [feedNavigation, profileNavigition, favoriteNavigation]
        
    }
//
//    private func configureFeed() -> Coordinator {
//        let feedChecker = FeedChecker()
//        let feedVC = FeedViewController(feedChecker: feedChecker)
//        let feedNav = UINavigationController(rootViewController: feedVC)
//        feedNav.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "house.fill"), tag: 0)
//        feedVC.title = "Feed"
//        let feedCoordinator = FeedFlowCoordinator(navigationController: feedNav)
//        tabbar.viewControllers = []
//        return feedCoordinator
//
//    }
    
    private func configureProfile() -> UINavigationController {
        let loginVC = LogInViewController()
        let loginNav = UINavigationController(rootViewController: loginVC)
        loginNav.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 0)
        loginNav.navigationBar.isHidden = true
        return loginNav
    }
    
    
}
