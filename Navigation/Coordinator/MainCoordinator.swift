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
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
         }
    
    func start() {
        let tabbar = TabBarController()
        tabbar.coordinator = self
        tabbar.setTabBar()
        navigationController.navigationBar.isHidden = true
        navigationController.pushViewController(tabbar, animated: true)
    }
}

