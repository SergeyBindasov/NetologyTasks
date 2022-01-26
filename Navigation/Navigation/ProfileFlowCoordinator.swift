//
//  ProfileFlowCoordinator.swift
//  Navigation
//
//  Created by Sergey on 06.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileFlowCoordinator: Coordinator {
    
    weak var coordinator: MainCoordinator?
    
    var coordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
      start()
    }
    
    func start() {
        let loginVC = LogInViewController()        
        loginVC.coordinator = self
        let loginFactory = MyLoginFactory()
        loginVC.delegate = loginFactory.makeLoginInspector()
        navigationController.pushViewController(loginVC, animated: true)
        
    }
    
    func loginAction(userService: UserService, userName: String) {
        let currentUser = userService
        let name = userName
        let profileVC = ProfileViewController(userService: currentUser, userName: name)
        profileVC.coordinator = self
        navigationController.pushViewController(profileVC, animated: true)
    }
    
    func showGallery() {
        let galleryVC = PhotosViewController()
        galleryVC.coordinator = self
        navigationController.pushViewController(galleryVC, animated: true)
    }
    
    func register() {
        let registerVC = RegisterViewController()
        registerVC.coordinator = self
        navigationController.present(registerVC, animated: true, completion: nil)
    }
    
}
