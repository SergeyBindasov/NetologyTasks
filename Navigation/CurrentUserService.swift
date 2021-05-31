//
//  CurrentUserService.swift
//  Navigation
//
//  Created by Sergey on 31.05.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class CurrentUserService: UserService {
    
    let userSergey = User(name: "Sergey" , avatar: UIImage(named: "17"), status: "ниченепонимаю")
    
    func userName(name: String) -> User {
        if name == "Sergey" {
            return userSergey
        } else {
            return User(name: "DustyTheCat", avatar: UIImage(named: "cat"), status: "я милый котик")
        }
    }
}

class TestUserService: UserService {
    
    let testUser = User(name: "тестовый Пользователь", avatar: UIImage(named: "05"), status: "привет!")
    
    func userName(name: String) -> User {
        return testUser
    }
}

