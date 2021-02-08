//
//  Post Presenter.swift
//  Navigation
//
//  Created by Sergey on 08.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PostPresenter: FeedViewOutput {
    
    var navigationController: UINavigationController?
    
    func showPost() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let postVC = storyboard.instantiateViewController(identifier: "postVC")
        navigationController?.show(postVC, sender: true)
    }
}
