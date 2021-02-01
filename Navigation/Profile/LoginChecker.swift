//
//  LoginChecker.swift
//  Navigation
//
//  Created by Sergey on 01.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class LoginChecker: UIViewController, LoginViewControllerDelegate {
   
    private lazy var loginView: LogInViewController = {
        let view = LogInViewController()
        view.delegate = self
        return view
    }()
   
    func shouldLoginChecked() -> Bool {
        guard let login = loginView.loginTF.text else { return false }
        return Checker.shared.checkLogin(login)
    }
    
    func shouldPasswordChecked() -> Bool {
        guard let password = loginView.passwordTF.text else { return false }
        return Checker.shared.checkPassword(password)
        
    }
    
}
