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
    
    lazy var planetLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        networkManager.delegate = self
        setupLayout()
        
        networkManager.performRequest(with: "https://jsonplaceholder.typicode.com/todos/4")
        networkManager.anotherRequest(with: "https://swapi.dev/api/planets/1")
    }
}



extension InfoViewController {
    // Задача 1
    func updateQuote(networManagwer: NetworkManager, dataModel: Item) {
        DispatchQueue.main.async {
            self.quoteLabel.text = dataModel.title
        }
    }
    // Задача 2
    func updatePlanet(networManagwer: NetworkManager, dataModel: PlanetModel) {
        DispatchQueue.main.async {
            self.planetLabel.text = dataModel.orbitalPeriod
        }
    }
    
    func setupLayout() {
        view.addSubviews(quoteLabel, planetLabel)
        let constraints = [
            quoteLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            quoteLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            planetLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            planetLabel.topAnchor.constraint(equalTo: quoteLabel.bottomAnchor, constant: 28)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
