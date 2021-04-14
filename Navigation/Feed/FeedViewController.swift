//
//  ViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    weak var coordinator: FeedFlowCoordinator?
    
    let post: Post = Post(title: "Пост")
    
    lazy var firstButton: UIButton = {
        let button = UIButton()
        button.setTitle("First Button", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(1.0), for: .normal)
        button.addTarget(self, action: #selector(firstButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    lazy var secondButton: UIButton = {
        let button = UIButton()
        button.setTitle("Second Button", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(1.0), for: .normal)
        button.addTarget(self, action: #selector(secondButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stv = UIStackView()
        stv.alignment = .fill
        stv.axis = .vertical
        stv.spacing = 10
        stv.distribution = .fillEqually
        return stv
    }()
    
    @objc func firstButtonPressed( ){
        coordinator?.showPost()
    }
    
    @objc func secondButtonPressed() {
        coordinator?.showPost()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubviews(stackView)
        setupLayout()
    }
}

extension FeedViewController {
    func setupLayout() {
        
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        let constraints = [
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            firstButton.heightAnchor.constraint(equalToConstant: 33),
            secondButton.heightAnchor.constraint(equalToConstant: 33),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
