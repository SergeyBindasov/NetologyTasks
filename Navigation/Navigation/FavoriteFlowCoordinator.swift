//
//  FavoriteFlowCoordinator.swift
//  Navigation
//
//  Created by Sergey on 16.02.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit

class FavoriteFlowCoordinator: Coordinator {
    
    weak var coordinator: MainCoordinator?
    
    var coordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
      start()
    }
    
    func start() {
        let favorite = FavoriteViewController()
        favorite.title = "Favorite"
        favorite.coordinator = self
        navigationController.pushViewController(favorite, animated: true)
    }
    
}
