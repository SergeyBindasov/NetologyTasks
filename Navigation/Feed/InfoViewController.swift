//
//  InfoViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController, QuoteDelegate {

    weak var coordinator: FeedFlowCoordinator?
    
    let networkManager = NetworkManager()
    
    lazy var quoteLabel: UILabel = {
        let lable = UILabel()
        lable.font = .systemFont(ofSize: 25, weight: .bold)
        return lable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        networkManager.delegate = self
        setupLayout()
        
        networkManager.performRequest(with: "https://jsonplaceholder.typicode.com/todos/4")
    }
}

extension InfoViewController {
    
    func updateQuote(networManagwer: NetworkManager, dataModel: Item) {
        DispatchQueue.main.async {
            self.quoteLabel.text = dataModel.title
        }
    }
    
    func setupLayout() {
        view.addSubviews(quoteLabel)
        let constraints = [
            quoteLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            quoteLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
