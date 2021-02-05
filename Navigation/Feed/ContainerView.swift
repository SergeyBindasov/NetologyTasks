//
//  ContainerView.swift
//  Navigation
//
//  Created by Sergey on 03.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ContainerView: UIView {
    
    lazy var firstButton: UIButton = {
        let button = UIButton()
        button.setTitle("First Button", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(1.0), for: .normal)
        button.addTarget(self, action: #selector(toPost), for: .touchUpInside)
        
        return button
    }()
    
    lazy var secondButton: UIButton = {
        let button = UIButton()
        button.setTitle("Second Button", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(1.0), for: .normal)
        
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
    
    override init(frame: CGRect) {
        super .init(frame: UIScreen.main.bounds)
        addSubviews(stackView)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func toPost(){
        //onTap()
        
    }
}

extension ContainerView {
    func setupLayout() {
        
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        let constraints = [
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            firstButton.heightAnchor.constraint(equalToConstant: 33),
            secondButton.heightAnchor.constraint(equalToConstant: 33),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

