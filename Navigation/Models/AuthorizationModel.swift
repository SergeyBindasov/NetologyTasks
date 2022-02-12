//
//  AuthorizationModel.swift
//  Navigation
//
//  Created by Sergey on 12.02.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import Foundation
import RealmSwift

class AuthorizationModel: Object {
    @objc dynamic var userLogin: String = ""
    @objc dynamic var userPassword: String = ""
    @objc dynamic var isCreated: Bool = false
}
