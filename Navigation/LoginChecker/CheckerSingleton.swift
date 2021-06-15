//
//  CheckerSingletone.swift
//  Navigation
//
//  Created by Sergey on 15.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

class Checker {
    
    static let shared: Checker = {
        let singleton = Checker()
        return singleton
    }()
    
    private let userName = "00"
    private let userPassword = "00"
    
    private init() {}
    
    func checkLoginAndPass(name: String, password: String) -> Bool {
        if name == userName && password == userPassword {
            return true
        } else {
            return false
        }
    }
}
