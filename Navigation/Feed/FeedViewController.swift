//
//  ViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

final class FeedViewController: UIViewController {
    
    weak var coordinator: FeedFlowCoordinator?
    
    private var text: String = ""
    
    private var feedChecker: FeedChecker
    
    private lazy var round: UILabel = {
        let lable = UILabel()
        lable.frame = CGRect(x: 0, y: 0, width: 90, height: 90)
        lable.layer.cornerRadius = lable.frame.width / 2
        lable.layer.masksToBounds = true
        lable.backgroundColor = #colorLiteral(red: 0.2989781797, green: 0.5310710073, blue: 0.7931908965, alpha: 1)
        
        return lable
    }()
    
    private lazy var textfield: CustomTextfield = {
        let textField = CustomTextfield(placeholder: "CheckData") { [weak self] text in
            self?.text = text
        }
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .systemGray6
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.tintColor = #colorLiteral(red: 0.2989781797, green: 0.5310710073, blue: 0.7931908965, alpha: 1)
        textField.autocapitalizationType = .none
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var button: CustomButton = {
        let button = CustomButton(onTap: self.checkTextfield)
        button.setTitle("Check!", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(1.0), for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .selected)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .highlighted)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .disabled)
        return button
    }()
    
    func checkTextfield() {
        guard let text = textfield.text else { return }
        if feedChecker.wordChecked(word: text) == true {
            round.backgroundColor = .green
        } else {
            round.backgroundColor = .red
        }
        coordinator?.showPost()
    }
    
    
    @objc func word() {
    }
    
    init(feedChecker: FeedChecker) {
        self.feedChecker = feedChecker
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        self.feedChecker = FeedChecker()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        #if DEBUG
        view.backgroundColor = .white
        
        setupLayout()
        #else
        view.backgroundColor = .black
        #endif
        print(type(of: self), #function)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "post" else {
            return
        }
        guard let postViewController = segue.destination as? PostViewController else {
            return
        }
    }
}

extension FeedViewController {
    func setupLayout() {
        view.addSubviews(round,textfield, button)
        
        let constraints = [
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: view.bounds.width - 32),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textfield.heightAnchor.constraint(equalToConstant: 50),
            textfield.widthAnchor.constraint(equalToConstant: view.bounds.width - 32),
            textfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textfield.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -32),
            round.widthAnchor.constraint(equalToConstant: 90),
            round.heightAnchor.constraint(equalToConstant: 90),
            round.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            round.bottomAnchor.constraint(equalTo: textfield.topAnchor, constant: -80)
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
