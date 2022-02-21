//
//  Post Struct.swift
//  Navigation
//
//  Created by Sergey on 29.05.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

public struct Post {
    public var author: String
    public var description: String
    public var image: UIImage?
    public var likes: Int
    public var views: Int
}

public struct Pic {
    public let image: UIImage?
}
