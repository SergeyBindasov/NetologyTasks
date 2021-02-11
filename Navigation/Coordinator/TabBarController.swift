//
//  TabBarController.swift
//  Navigation
//
//  Created by Sergey on 10.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    weak var coordinator: MainCoordinator?
    

    func editFeedNav() -> UINavigationController {
        let feedVC = FeedViewController.instantiate()
        feedVC.title = "Feed"
        feedVC.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "house.fill"), tag: 0)
        navigationController?.pushViewController(feedVC, animated: true)
        return UINavigationController(rootViewController: feedVC)
    }
    
    func editProfileNav() -> UINavigationController {
        let profileVC = LogInViewController.instantiate()
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 0)
        navigationController?.pushViewController(profileVC, animated: true)
        return UINavigationController(rootViewController: profileVC)
    }
    
    func setTabBar() {
        FeedViewController().navigationController?.navigationBar.isHidden = true
        viewControllers = [editFeedNav(), editProfileNav()]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
