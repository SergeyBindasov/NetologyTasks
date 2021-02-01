//
//  Checker.swift
//  Navigation
//
//  Created by Sergey on 28.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class Checker {
    
    static let shared: Checker = {
        let info = Checker()
        return info
    }()
    
    var login = "Sergey"
    var password = "Bindasov"
    
    func checkLogin(_: String) -> Bool {
        if login == login {
            return true
        } else {
            return false
        }
    }
    
    func checkPassword(_: String) -> Bool {
        if password == password {
            return true
        } else {
            return false
        }
    }
}
