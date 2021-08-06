//
//  CoordinatorProtocol.swift
//  Navigation
//
//  Created by Sergey on 05.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

protocol Coordinator: AnyObject {
    var coordinators: [Coordinator] { get set }
    
}
