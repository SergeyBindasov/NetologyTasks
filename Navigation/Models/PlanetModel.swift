//
//  PlanetModel.swift
//  Navigation
//
//  Created by Sergey on 25.01.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import Foundation

struct PlanetModel: Codable {
    var name: String
    var rotationPeriod: String
    var orbitalPeriod: String
    var diameter: String
    var climate: String
    var gravity: String
    var terrain: String
    var surfaceWater: String
    var population: String
    var residents: [String]
    var films: [String]
    var created: String
    var edited: String
    var url: String
    
}
