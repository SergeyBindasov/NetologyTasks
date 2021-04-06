//
//  FeedFlowCoordinator.swift
//  Navigation
//
//  Created by Sergey on 11.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class FeedFlowCoordinator: Coordinator {
    
    weak var coordinator: MainCoordinator?
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let feedVC = FeedViewController()
        feedVC.title = "Feed"
        feedVC.coordinator = self
        navigationController.pushViewController(feedVC, animated: true)
    }
    
    func showPost() {
        let postVC = PostViewController()
        postVC.title = "Post"
        postVC.coordinator = self
        navigationController.pushViewController(postVC, animated: true)
    }
    
    func showInfo() {
        let infoVC = InfoViewController.instantiate()
        infoVC.coordinator = self
        navigationController.present(infoVC, animated: true, completion: nil)
    }    
}
