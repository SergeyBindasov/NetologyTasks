//
//  QuoteDelegate.swift
//  Navigation
//
//  Created by Sergey on 24.01.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import Foundation

protocol QuoteDelegate {
    func updateQuote(networManagwer: NetworkManager, dataModel: Item)
    
    func updatePlanet(networManagwer: NetworkManager, dataModel: PlanetModel)
    
    
    func()
}
