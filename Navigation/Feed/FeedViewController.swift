//
//  ViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

protocol FeedViewOutput {
    var navigationController: UINavigationController? { get set }
    func showPost()
    
}

final class FeedViewController: UIViewController {
    
    let post: Post = Post(title: "Пост")
    
    var output: FeedViewOutput?
    
    
    init(output: FeedViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
    }
    
    
    private lazy var containerView: ContainerView = {
        let container = ContainerView()
        container.onTap = {
            self.output?.showPost()
        }
        return container
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(containerView)
        output?.navigationController = self.navigationController
    }
    
}

