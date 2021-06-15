//
//  UserService.swift
//  Navigation
//
//  Created by Sergey on 31.05.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

protocol UserService {
    func userName(by name: String) -> User
}
