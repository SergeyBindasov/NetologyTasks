//
//  DataModel.swift
//  Navigation
//
//  Created by Sergey on 24.01.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import Foundation

struct DataModel {
    var item: [Item]
}

struct Item {
    var userID: Int?
    var id: Int?
    var title: String?
    var completed: Bool?
}
