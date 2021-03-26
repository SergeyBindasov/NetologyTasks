//
//  ProfileFlowCoordinator.swift
//  Navigation
//
//  Created by Sergey on 11.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileFlowCoordinator: Coordinator {
    
    weak var coordinator: MainCoordinator?
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginVC = LogInViewController.instantiate()
        loginVC.coordinator = self
        navigationController.pushViewController(loginVC, animated: true)
    }
    
    func loginAction() {
        let profileVC = ProfileViewController()
        profileVC.coordinator = self
        navigationController.pushViewController(profileVC, animated: true)
    }
    
    func showGallery() {
        let galleryVC = PhotosViewController()
        galleryVC.coordinator = self
        navigationController.pushViewController(galleryVC, animated: true)
    }
}
