//
//  LoginChecker.swift
//  Navigation
//
//  Created by Sergey on 06.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
class LoginChecker: UIViewController, LoginViewControllerDelegate {
    
    
    func shouldLoginChecked(login: String) -> Bool {
        
        return login == Checker.shared.login
    }
    
    func shouldPasswordChecked(password: String) -> Bool {
        
        return password == Checker.shared.password
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
