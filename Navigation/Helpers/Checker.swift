//
//  Checker.swift
//  Navigation
//
//  Created by Sergey on 06.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

class Checker {
    
    static let shared: Checker = {
        let info = Checker()
        return info
    }()
    
    var login = "12"
    var password = "345"
    
    private init() { }
    
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
