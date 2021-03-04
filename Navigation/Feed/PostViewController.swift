//
//  PostViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    
    weak var coordinator: FeedFlowCoordinator?
    
    var post: Post?
    var timer = Timer()
    var timerDisplayed = 0
    
    private lazy var timerLabel: UILabel = {
       let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        lable.numberOfLines = 2
        lable.textColor = .black
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        return lable
    }()
 
    @objc func addButtonPreseed() {
        coordinator?.showInfo()
    }
    
    @objc func updateTimer() {
        timerDisplayed += 1
        timerLabel.text = "Timer: \(String(timerDisplayed))"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        view.addSubviewWithAutoLayout(timerLabel)
        setupLayout()
        timerDisplayed = 0
       
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPreseed))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        timerDisplayed = 0
        updateTimer()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        timerDisplayed = 0
    }
}

private extension PostViewController {
    func setupLayout() {
        let constarints = [
            timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        NSLayoutConstraint.activate(constarints)
    }
}
