//
//  FeedFlowCoordinator.swift
//  Navigation
//
//  Created by Sergey on 05.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class FeedFlowCoordinator: Coordinator {
    
    weak var coordinator: MainCoordinator?
    
    var coordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
      start()
    }
    
    func start() {
        let feedVC = FeedViewController(feedChecker: FeedChecker())
       
        feedVC.title = "Feed".localized
        feedVC.coordinator = self
        navigationController.pushViewController(feedVC, animated: true)
        
    }

    
    func showPost() {
        let postVC = PostViewController()
        postVC.coordinator = self
        postVC.title = "Post".localized
        navigationController.pushViewController(postVC, animated: true)
    }
    
    func showInfo() {
        let infoVC = InfoViewController()
        infoVC.coordinator = self
        infoVC.title = "Info".localized
        infoVC.modalPresentationStyle = .popover
        navigationController.present(infoVC, animated: true, completion: nil)
    }
    
    
    
    
}

