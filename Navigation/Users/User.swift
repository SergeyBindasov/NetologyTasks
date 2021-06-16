//
//  User.swift
//  Navigation
//
//  Created by Sergey on 31.05.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

final class User {
    var name: String
    var avatar: UIImage?
    var status: String
    
    init(name: String, avatar: UIImage?, status: String) {
        self.name = name
        self.avatar = avatar
        self.status = status
    }
}

