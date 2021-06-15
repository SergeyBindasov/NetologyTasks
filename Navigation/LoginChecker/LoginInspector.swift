//
//  LoginInspector.swift
//  Navigation
//
//  Created by Sergey on 15.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

final class LoginInspector: LoginViewControllerDelegate {
    
    func shouldLoginPasswordChecked(login: String, password: String) -> Bool {
        return Checker.shared.checkLoginAndPass(name: login, password: password)

}
}
