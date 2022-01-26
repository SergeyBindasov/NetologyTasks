//
//  RegisterViewController.swift
//  Navigation
//
//  Created by Sergey on 26.01.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    weak var coordinator: ProfileFlowCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2989781797, green: 0.5310710073, blue: 0.7931908965, alpha: 1)
    }
}
