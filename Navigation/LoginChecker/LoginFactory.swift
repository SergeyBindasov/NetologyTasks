//
//  LoginFactory.swift
//  Navigation
//
//  Created by Sergey on 15.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

protocol LoginFactory {
    func makeLoginInspector() -> LoginInspector
}
