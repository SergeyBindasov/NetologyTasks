//
//  LoginChecker.swift
//  Navigation
//
//  Created by Sergey on 01.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class LoginChecker: UIViewController, LoginViewControllerDelegate {
    

    func shouldLoginChecked(login: String) -> Bool {
        
        if login == Checker.shared.login {
            return true
        }
        print("Login incorrect")
        return false
    }
    
    
    func shouldPasswordChecked(password: String) -> Bool {
        
        let validPassword = Checker.shared.password
        if password == validPassword {
            return true
        }
        print("Pswd incorrect")
        return false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
