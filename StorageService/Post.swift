//
//  Post Struct.swift
//  Navigation
//
//  Created by Sergey on 29.05.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

public struct Post {
    public let author: String
    public let description: String
    public let image: UIImage?
    public let likes: Int
    public let views: Int
}

public struct Pic {
    public let image: UIImage?
}
